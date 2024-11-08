# MyToken

This Solidity contract is a simple demonstration of how to create, mint, and burn tokens using the Ethereum blockchain. The project is part of the ETH PROOF: Beginner EVM Course offered by Metacrafters. It teaches the fundamentals of writing a smart contract that simulates a token creation system.

## Description

This project allows the creation of a custom token on the Ethereum blockchain, with basic functionalities such as minting and burning tokens. The contract stores the token's name, symbol, and total supply as public variables. It also maintains a mapping of addresses to their token balances. Users can increase the total supply by minting tokens or decrease the total supply by burning them. The burn function ensures that tokens can only be destroyed if the user has a sufficient balance.

## Getting Started

### Installing

1. Download or clone this repository from GitHub.
2. Open the project in Remix (an online Solidity IDE): [Remix IDE](https://remix.ethereum.org).
3. Navigate to the `MyToken.sol` file in the file explorer of Remix.

### Executing Program

1. **Compile the Contract:**
   - In Remix, select the correct Solidity compiler version (`0.8.28`) from the "Solidity Compiler" tab.
   - Click "Compile MyToken.sol" to compile the contract.

2. **Deploy the Contract:**
   - Go to the "Deploy & Run Transactions" tab in Remix.
   - Select the "MyToken" contract from the dropdown.
   - Click "Deploy" to deploy the contract on a test network or a local blockchain.

3. **Interact with the Contract:**
   - **Minting Tokens:**
     - Call the `mint` function with an address and the number of tokens to mint.
     - For example: mint 1000 tokens to `0x5B38Da6a701c568545dCfcB03FcB875f56beddC4`.
     - Verify that the `totalSupply` increases and the address balance updates accordingly.
   - **Burning Tokens:**
     - Call the `burn` function with the same address and the number of tokens to burn.
     - For example: burn 750 tokens from `0x5B38Da6a701c568545dCfcB03FcB875f56beddC4`.
     - The `totalSupply` decreases, and the address balance reflects the reduced token amount.

   Here’s a sample interaction:
   ```
   mint(address, 1000) // Mint 1000 tokens
   burn(address, 750)  // Burn 750 tokens
   ```

## Help

- **Common Issue:** Error when trying to burn more tokens than available.
- **Solution:** Ensure that the address balance is greater than or equal to the amount you are trying to burn.

```solidity
require(balances[_from] >= _amount, "Insufficient balance to burn");
```

## Author

Jasmine Camasura

FEU Institute of Technology
