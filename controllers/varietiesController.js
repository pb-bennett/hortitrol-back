const Joi = require('joi');

const sequelize = require('../db');
const initModels = require('../models/init-models');
const APIQueries = require('../utils/apiQueries');

const models = initModels(sequelize);

const searchBuilder = require('sequelize-search-builder');

// console.log(models);

exports.getAllVarieties = async function (req, res, next) {
  try {
    // console.log(viableComlumns);
    const search = new searchBuilder(models.varieties, req.query),
      whereQuery = search.getWhereQuery(),
      orderQuery = search.getOrderQuery(),
      limitQuery = search.getLimitQuery(),
      offsetQuery = search.getOffsetQuery();
    // const apiQueries = new APIQueries(models.varieties, req.query);
    // const query = apiQueries.filter();
    const results = await models.varieties.findAll({
      include: [{ all: true, nested: true, duplicating: false }],
      where: [whereQuery],
    });

    return res.status(200).json({
      status: 'success',
      results: results,
    });
  } catch (error) {
    console.error(error);
  }
};

exports.newVariety = async function (req, res, next) {
  try {
    const { varietyName, plantType } = req.body;

    const result = await models.varieties.create({ varietyName, plantType });
    console.log(result);

    return res.status(200).json({
      status: 'success',
      results: result.dataValues,
    });
  } catch (error) {
    console.error(error);
  }
};

exports.getVariety = async function (req, res, next) {
  try {
    const id = req.params.id;
    const result = await models.varieties.findByPk(id);
    if (!result)
      return res.status(404).json({
        status: 'failure',
        result: `ID ${id} not found in database.`,
      });

    return res.status(200).json({
      status: 'success',
      results: result,
    });
  } catch (error) {
    console.error(error);
  }
};

exports.updateVariety = async function (req, res, next) {
  try {
    const id = req.params.id;
    const variety = await models.varieties.findByPk(id);
    if (!variety)
      return res.status(404).json({
        status: 'failure',
        results: `ID ${id} not found in database.`,
      });
    await models.varieties.update(req.body, {
      where: {
        id,
      },
    });
    const result = await models.varieties.findByPk(id);

    console.log('😆😆😆', result);

    return res.status(200).json({
      status: 'success',
      results: result,
    });
  } catch (error) {
    console.error(error);
  }
};

exports.deleteVariety = async function (req, res, next) {
  try {
    const id = req.params.id;
    const variety = await models.varieties.findByPk(id);
    if (!variety)
      return res.status(404).json({
        status: 'failure',
        results: `ID ${id} not found in database.`,
      });
    await models.varieties.destroy({
      where: {
        id,
      },
    });
    return res.status(200).json({
      status: 'success',
      results: 'Deleted',
    });
  } catch (error) {
    console.error(error);
  }
};

// const test = async function () {
//   try {
//     await sequelize.authenticate();
//     console.log('Connection has been established successfully.');
//   } catch (error) {
//     console.error('Unable to connect to the database:', error);
//   }
// };

//
// test();
