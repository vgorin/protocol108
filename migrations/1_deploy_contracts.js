module.exports = async function(deployer, network, accounts) {
	const Protocol108 = artifacts.require("./Protocol108.sol");

	await deployer.deploy(Protocol108);
};
