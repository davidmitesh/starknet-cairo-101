const starknet = require("hardhat").starknet;

/**
 * @dev This function deploy a StarkNet account and logs the address and private key for later use
 * This make take up to 10 minutes to run. See https://stats.goerli.net/ for block times
 */
async function deployLogAccount() {

    const AllInOneContract = await starknet.getContractFactory("AllInOneContract");
    const nftContract = await AllInOneContract.deploy();
    console.log(`Deployed AllInOne Contract to address ${nftContract.address}`);

}

deployLogAccount()
    .then(() => process.exit(0))
    .catch((err) => console.log(err)); ``
