const SecureBox = artifacts.require("SecureBox");

module.exports = function(deployer) {
  deployer.deploy(SecureBox);
};
