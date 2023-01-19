const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('varietiesURLs', {
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
    varietyURL: {
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
    tableName: 'varietiesURLs',
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
    ]
  });
};
