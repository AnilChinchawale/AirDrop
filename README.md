# Airdrop Contract

The Airdrop contract is designed to distribute a fixed amount of XRC20 tokens to users who have interacted with the XSWAP v3 DEX and hold a minimum balance of XDC. 

## Contract Functions

- `constructor(address _xrc20Token, address _xswapV3)`: Initializes the contract with the address of the XRC20 token and the XSWAP v3 DEX.
- `airdropTo(address recipient)`: Airdrops tokens to a recipient who has met the interaction and balance requirements.
- `withdrawTokens(address to, uint256 amount)`: Allows the admin to withdraw tokens from the contract after the airdrop period has ended.

## Requirements

- Node.js
- Hardhat
- Ethers.js
- A web3 wallet like XDCPay, MetaMask, or BlocksPay

## Setup

To run this in your local environment, follow these steps:

1. Install dependencies:

    ```bash
    npm i
    ```

2. Compile the smart contracts:

    ```bash
    npx hardhat compile
    ```

3. Deploy the smart contracts to the XDC network (ensure you have the right network configuration in `hardhat.config.js`):

    ```bash
    npx hardhat run scripts/deploy.js --network xdcapothem
    ```

## Deployed Method

The `deploy.js` script in the `scripts` directory handles the deployment of your Airdrop contract. Make sure to replace `'YOUR_XRC20_ADDRESS'` and `'YOUR_XSWAPV3_ADDRESS'` with the actual contract addresses before deploying.

After running the deploy script, the address of the deployed contract will be logged to the console. Ensure you have sufficient XDC for gas fees and your Hardhat configuration is correct for the XDC network.

## Interacting with the Contract

Once deployed, you can interact with the contract through Hardhat tasks or your dApp's frontend using Ethers.js or Web3.js.

Ensure users understand they need to have interacted with XSWAP v3 and hold the required XDC balance to be eligible for the airdrop.


## Future Roadmap

### Enhanced User Interface

- **Interactive Airdrop Platform:** Develop a user-friendly interface allowing users to easily participate in the airdrop without needing to interact directly with the smart contract. This will improve accessibility and usability for non-technical users.

### Multi-Token Support

- **Universal Airdrop Support:** Extend the platform's capabilities to support airdrops of any XRC20 tokens, allowing users to receive multiple types of tokens through our interface.

### Automation Features

- **Scheduled Airdrops:** Implement functionality for scheduling airdrops at specific times, enabling automated distribution without manual initiation.

### Integration with XSWAP v3

- **Seamless DEX Interaction:** Enhance integration with XSWAP v3 to automatically verify user interactions and balances, streamlining the airdrop qualification process.

### Security Enhancements

- **Smart Contract Audits:** Regularly audit smart contracts to ensure security and trustworthiness of the platform.

- **User Privacy Protection:** Implement features to protect user privacy and data during interactions with the platform.

### Multisender Capabilities

- **Batch Sending:** Develop multisender capabilities allowing users to send multiple airdrops to different addresses in one transaction, significantly reducing gas fees and enhancing efficiency.

- **User-Friendly Multisender Interface:** Create an intuitive interface for users to easily perform batch sends of different tokens to multiple recipients.

## Contributing

We welcome contributions from the community. Please read our contributing guidelines before submitting pull requests to the project.
