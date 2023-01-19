const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('batches', {
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
    trayID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'trays',
        key: 'id'
      }
    },
    activeStatus: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    },
    qtyPlanted: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 1
    },
    qtyGerminated: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    sewnDate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    germinatedDate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    trayPositons: {
      type: DataTypes.STRING(155),
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
    tableName: 'batches',
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
        name: "trayID",
        using: "BTREE",
        fields: [
          { name: "trayID" },
        ]
      },
    ]
  });
};
