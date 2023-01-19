const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('batchComments', {
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
    batchComment: {
      type: DataTypes.STRING(255),
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
    tableName: 'batchComments',
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
