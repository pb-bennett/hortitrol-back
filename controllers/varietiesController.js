const Joi = require('joi');

const sequelize = require('../db');
const initModels = require('../models/init-models');
const APIQueries = require('../utils/apiQueries');
const searchBuilder = require('sequelize-search-builder');

const models = initModels(sequelize);
const catchAsync = require('../utils/catchAsync');

// console.log(models);

exports.searchAllVarieties = catchAsync(async function (req, res, next) {
  // console.log(viableComlumns);
  const search = new searchBuilder(models.varieties, req.query),
    whereQuery = search.getWhereQuery(),
    orderQuery = search.getOrderQuery(),
    limitQuery = search.getLimitQuery(),
    offsetQuery = search.getOffsetQuery();

  const results = await models.varieties.findAll({
    // include: [{ all: true, nested: false, duplicating: false }],
    include: [{ model: models.varietiesPhotos, as: 'varietiesPhotos' }],
    where: whereQuery,
    order: orderQuery,
    limit: limitQuery,
    offset: offsetQuery,
    // logging:
  });

  return res.status(200).json({
    status: 'success',
    length: results.length,
    results: results,
  });
});

exports.getAllVarieties = catchAsync(async function (req, res, next) {
  const results = await models.varieties.findAll({
    // include: [{ all: true, nested: true, duplicating: false }],
  });

  return res.status(200).json({
    status: 'success',
    length: results.length,
    results: results,
  });
});

exports.newVariety = catchAsync(async function (req, res, next) {
  const { varietyName, plantType } = req.body;

  const result = await models.varieties.create({ varietyName, plantType });
  console.log(result);

  return res.status(200).json({
    status: 'success',
    results: result.dataValues,
  });
});

exports.getVariety = catchAsync(async function (req, res, next) {
  const id = req.params.id;
  const result = await models.varieties.findByPk(id);
  if (!result)
    return res.status(404).json({
      status: 'error',
      result: `ID ${id} not found in database.`,
    });

  return res.status(200).json({
    status: 'success',
    results: result,
  });
});

exports.updateVariety = catchAsync(async function (req, res, next) {
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
});

exports.deleteVariety = catchAsync(async function (req, res, next) {
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
});

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
