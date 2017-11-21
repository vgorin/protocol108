module.exports = function(deployer, network) {
	var Protocol108 = artifacts.require("./Protocol108.sol");

	if(network === 'main') {
		deployer.deploy(Protocol108, 6480);
	}
	else {
		deployer.deploy(Protocol108, 108);
	}
};
