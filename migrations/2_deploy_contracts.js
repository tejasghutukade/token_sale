var TjToken = artifacts.require("./TjToken.sol");

module.exports = function(deployer) {
  deployer.deploy(TjToken,1000000);
};
