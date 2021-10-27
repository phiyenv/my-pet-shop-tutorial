/* Migrating our contract to the blockchain */

var Adoption = artifacts.require("Adoption");

module.exports = function (deployer){
      deployer.deploy(Adoption);
}