const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('pots', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    size: {
      type: DataTypes.STRING(55),
      allowNull: false
    },
    potName: {
      type: DataTypes.STRING(55),
      allowNull: false,
      unique: "potName"
    },
    hashID: {
      type: DataTypes.STRING(45),
      allowNull: false,
      unique: "hashID"
    },
    activeStatus: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
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
    tableName: 'pots',
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
        name: "potName",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "potName" },
        ]
      },
      {
        name: "hashID",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "hashID" },
        ]
      },
    ]
  });
};
