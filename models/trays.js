const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('trays', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    size: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    },
    trayName: {
      type: DataTypes.STRING(55),
      allowNull: false,
      unique: "trayName"
    },
    hashID: {
      type: DataTypes.STRING(45),
      allowNull: true
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
    tableName: 'trays',
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
        name: "trayName",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "trayName" },
        ]
      },
    ]
  });
};
