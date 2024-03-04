const hre = require("hardhat");

async function main() {
  // Compile our contract
  await hre.run('compile');

  // Deploy the contract
  const Airdrop = await hre.ethers.getContractFactory("Airdrop");
  
  // Replace 'YOUR_XRC20_ADDRESS' and 'YOUR_XSWAPV3_ADDRESS' with actual contract addresses
  const airdrop = await Airdrop.deploy('YOUR_XRC20_ADDRESS', 'YOUR_XSWAPV3_ADDRESS');

  console.log(`Airdrop contract deployed to: ${airdrop.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
