const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('batchPhotos', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    batchID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'batches',
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
    tableName: 'batchPhotos',
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
        name: "batchID",
        using: "BTREE",
        fields: [
          { name: "batchID" },
        ]
      },
    ]
  });
};
