const Joi = require('joi');

const sequelize = require('../db');
const initModels = require('../models/init-models');

const models = initModels(sequelize);

// console.log(models);

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

exports.getAllVarieties = async function (req, res, next) {
  try {
    const results1 = await models.varieties.findAll();
    console.log('🤩RESULTS:', results1[0].varietyName);
    const results2 = await results1.map(async element => {
      const varietyURL = await models.varietiesURLs.findAll({ where: { varietyID: element.id } });
      // console.log(varietyURL);
    });
    console.log(results2);

    return res.status(200).json({
      status: 'success',
      results: results2,
    });
  } catch (error) {
    console.error(error);
  }
};

exports.getVariety = async function (req, res, next) {
  try {
    const id = req.params.id;

    const result = await models.varieties.findAll({
      where: {
        id,
      },
    });
    console.log(result);

    if (!result[0])
      return res.status(404).json({
        status: 'failure',
        result: 'ID not found in database.',
      });

    return res.status(200).json({
      status: 'success',
      results: result,
    });
  } catch (error) {
    console.error(error);
  }
};

exports.newVariety = async function (req, res, next) {
  try {
    console.log(req.body);
    // const schema = Joi.object({
    //   varietyName: Joi.string().max(155).required().lowercase(),
    //   plantType: Joi.string().max(155).required().lowercase(),
    // });

    // const data = schema.validate(req.body);
    // if (data.error)
    //   return res.status(400).json({
    //     status: 'failure',
    //     results: data.error.message,
    //   });
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

// const dbLookup = async function () {
//   result = await db.execute('SELECT * FROM varieties;');
//   console.log(result[0]);
// };
