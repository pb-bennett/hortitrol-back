const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('plantsPhotos', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    plantID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'plants',
        key: 'id'
      }
    },
    imgURL: {
      type: DataTypes.STRING(155),
      allowNull: false
    },
    createdDate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    editDate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'plantsPhotos',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "plantID",
        using: "BTREE",
        fields: [
          { name: "plantID" },
        ]
      },
    ]
  });
};
