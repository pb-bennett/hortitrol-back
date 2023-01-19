const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('varieties', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    varietyName: {
      type: DataTypes.STRING(155),
      allowNull: false,
      unique: "varietyName"
    },
    plantType: {
      type: DataTypes.STRING(155),
      allowNull: false
    },
    dateCreated: {
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
    tableName: 'varieties',
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
        name: "varietyName",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "varietyName" },
        ]
      },
    ]
  });
};
