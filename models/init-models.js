var DataTypes = require("sequelize").DataTypes;
var _batchComments = require("./batchComments");
var _batchMeasurements = require("./batchMeasurements");
var _batchPhotos = require("./batchPhotos");
var _batches = require("./batches");
var _plants = require("./plants");
var _plantsComments = require("./plantsComments");
var _plantsMeasurements = require("./plantsMeasurements");
var _plantsPhotos = require("./plantsPhotos");
var _pots = require("./pots");
var _trays = require("./trays");
var _varieties = require("./varieties");
var _varietiesPhotos = require("./varietiesPhotos");
var _varietiesURLs = require("./varietiesURLs");

function initModels(sequelize) {
  var batchComments = _batchComments(sequelize, DataTypes);
  var batchMeasurements = _batchMeasurements(sequelize, DataTypes);
  var batchPhotos = _batchPhotos(sequelize, DataTypes);
  var batches = _batches(sequelize, DataTypes);
  var plants = _plants(sequelize, DataTypes);
  var plantsComments = _plantsComments(sequelize, DataTypes);
  var plantsMeasurements = _plantsMeasurements(sequelize, DataTypes);
  var plantsPhotos = _plantsPhotos(sequelize, DataTypes);
  var pots = _pots(sequelize, DataTypes);
  var trays = _trays(sequelize, DataTypes);
  var varieties = _varieties(sequelize, DataTypes);
  var varietiesPhotos = _varietiesPhotos(sequelize, DataTypes);
  var varietiesURLs = _varietiesURLs(sequelize, DataTypes);

  batchComments.belongsTo(batches, { as: "batch", foreignKey: "batchID"});
  batches.hasMany(batchComments, { as: "batchComments", foreignKey: "batchID"});
  batchMeasurements.belongsTo(batches, { as: "batch", foreignKey: "batchID"});
  batches.hasMany(batchMeasurements, { as: "batchMeasurements", foreignKey: "batchID"});
  batchPhotos.belongsTo(batches, { as: "batch", foreignKey: "batchID"});
  batches.hasMany(batchPhotos, { as: "batchPhotos", foreignKey: "batchID"});
  plants.belongsTo(batches, { as: "batch", foreignKey: "batchID"});
  batches.hasMany(plants, { as: "plants", foreignKey: "batchID"});
  plantsComments.belongsTo(plants, { as: "plant", foreignKey: "plantID"});
  plants.hasMany(plantsComments, { as: "plantsComments", foreignKey: "plantID"});
  plantsMeasurements.belongsTo(plants, { as: "plant", foreignKey: "plantID"});
  plants.hasMany(plantsMeasurements, { as: "plantsMeasurements", foreignKey: "plantID"});
  plantsPhotos.belongsTo(plants, { as: "plant", foreignKey: "plantID"});
  plants.hasMany(plantsPhotos, { as: "plantsPhotos", foreignKey: "plantID"});
  plants.belongsTo(pots, { as: "pot", foreignKey: "potID"});
  pots.hasMany(plants, { as: "plants", foreignKey: "potID"});
  batches.belongsTo(trays, { as: "tray", foreignKey: "trayID"});
  trays.hasMany(batches, { as: "batches", foreignKey: "trayID"});
  batches.belongsTo(varieties, { as: "variety", foreignKey: "varietyID"});
  varieties.hasMany(batches, { as: "batches", foreignKey: "varietyID"});
  plants.belongsTo(varieties, { as: "variety", foreignKey: "varietyID"});
  varieties.hasMany(plants, { as: "plants", foreignKey: "varietyID"});
  varietiesPhotos.belongsTo(varieties, { as: "variety", foreignKey: "varietyID"});
  varieties.hasMany(varietiesPhotos, { as: "varietiesPhotos", foreignKey: "varietyID"});
  varietiesURLs.belongsTo(varieties, { as: "variety", foreignKey: "varietyID"});
  varieties.hasMany(varietiesURLs, { as: "varietiesURLs", foreignKey: "varietyID"});

  return {
    batchComments,
    batchMeasurements,
    batchPhotos,
    batches,
    plants,
    plantsComments,
    plantsMeasurements,
    plantsPhotos,
    pots,
    trays,
    varieties,
    varietiesPhotos,
    varietiesURLs,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
