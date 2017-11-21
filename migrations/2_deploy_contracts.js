module.exports = function(deployer, network) {
	var Protocol108 = artifacts.require("./Protocol108.sol");

	deployer.deploy(Protocol108);
};
