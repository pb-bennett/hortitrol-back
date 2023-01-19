const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('plants', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    varietyID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'varieties',
        key: 'id'
      }
    },
    potID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'pots',
        key: 'id'
      }
    },
    batchID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
      references: {
        model: 'batches',
        key: 'id'
      }
    },
    activeStatus: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    },
    repottedDate1: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    repottedDate2: {
      type: DataTypes.DATE,
      allowNull: true
    },
    hashID: {
      type: DataTypes.STRING(45),
      allowNull: true
    },
    editDate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'plants',
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
        name: "varietyID",
        using: "BTREE",
        fields: [
          { name: "varietyID" },
        ]
      },
      {
        name: "potID",
        using: "BTREE",
        fields: [
          { name: "potID" },
        ]
      },
      {
        name: "batchID",
        using: "BTREE",
        fields: [
          { name: "batchID" },
        ]
      },
    ]
  });
};
