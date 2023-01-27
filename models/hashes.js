const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('hashes', {
    hashID: {
      type: DataTypes.STRING(45),
      allowNull: false
    },
    IDType: {
      type: DataTypes.STRING(45),
      allowNull: false,
      primaryKey: true
    },
    ForeignID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
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
    tableName: 'hashes',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "IDType" },
          { name: "ForeignID" },
        ]
      },
    ]
  });
};
