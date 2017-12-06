module.exports = async function(deployer, network, accounts) {
	const Protocol108 = artifacts.require("./Protocol108.sol");
	const Protocol108v2 = artifacts.require("./Protocol108v2.sol");

	await deployer.deploy(Protocol108);
	await deployer.deploy(Protocol108v2);
};
