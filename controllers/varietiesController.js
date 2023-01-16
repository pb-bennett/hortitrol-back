const db = require('../db');

exports.getAllVarieties = async function (req, res, next) {
  try {
    const result = await db.execute('SELECT * FROM varieties;');
    // console.log(req.params);
    return res.status(200).json({
      status: 'success',
      results: result[0],
    });
  } catch (error) {
    console.error(error);
  }
};

exports.getVariety = async function (req, res, next) {
  try {
    const id = req.params.id;
    const exists = await db.execute('SELECT COUNT(id) as count FROM varieties WHERE id = ?', [id]);
    console.log(exists[0][0].count);
    if (exists[0][0].count === 0)
      return res.status(400).json({
        status: 'failure',
        results: 'Requested variety ID does not exist.',
      });
    const result = await db.execute('SELECT * FROM varieties WHERE id = ?;', [id]);
    return res.status(200).json({
      status: 'success',
      results: result[0],
    });
  } catch (error) {
    console.error(error);
  }
};

// exports.newVariety = async function (req, res, next) {
//   try {
//     console.log(req.body);

//     // console.log(req.params);
//     return res.status(200).json({
//       status: 'success',
//       results: result[0],
//     });
//   } catch (error) {
//     console.error(error);
//   }
// };

// const dbLookup = async function () {
//   result = await db.execute('SELECT * FROM varieties;');
//   console.log(result[0]);
// };
