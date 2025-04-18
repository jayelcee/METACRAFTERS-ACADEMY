# StakeToken Contract  

A Solidity smart contract for creating an ERC20 token named **StakeToken (STK)**. The contract allows the owner to mint tokens, while all users can transfer and burn tokens, adhering to the ERC20 standard.  

## Description  

The **StakeToken** contract provides a simple implementation of the ERC20 token standard with additional functionality for token burning and controlled minting. It uses OpenZeppelin libraries to ensure security and efficiency.  

## Features  

- **Minting**: Only the contract owner can mint new tokens to any address.  
- **Burning**: Any token holder can burn (destroy) their tokens to reduce the total supply.  
- **Transferring**: Token holders can transfer tokens to other addresses.

Video Demo: https://www.loom.com/share/8acdcbfb5936438d8d2da1f9d7682d4f

## Getting Started  

### Installation  

1. Use [Remix IDE](https://remix.ethereum.org/) to deploy and interact with the contract.  
2. Import the required OpenZeppelin libraries in Remix.  

### Deployment  

1. Deploy the contract by providing the address of the initial owner in the constructor.  
2. Fund the owner's address with an initial token supply by calling the `mint` function.  

### Execution  

- **Mint Tokens**:  
  The contract owner calls the `mint(address to, uint256 amount)` function to create new tokens and assign them to the specified address.  
- **Transfer Tokens**:  
  Token holders call `transfer(address to, uint256 value)` to send tokens to another address.  
- **Burn Tokens**:  
  Token holders call `burn(uint256 amount)` to destroy their tokens.  

## Contract Details  

- **Constructor**:  
  Initializes the contract with the token name, symbol, and ownership.  

- **Public Functions**:  
  - `mint(address to, uint256 amount)`: Mints new tokens. Restricted to the contract owner.  
  - `transfer(address to, uint256 value)`: Transfers tokens from the caller to another address.  
  - `burn(uint256 amount)`: Burns the caller's tokens to reduce total supply.  

- **Modifiers and Access Control**:  
  - **`onlyOwner`**: Restricts the minting function to the contract owner.  

## Error Handling  

- **`require`**: Validates sufficient balance for transfers and checks for minting permissions.  
- **`revert`**: Ensures transactions roll back on errors such as invalid transfers or minting attempts by non-owners.  

## Usage Example  

1. The owner mints 1000 STK tokens to a user's address:  
   ```solidity  
   mint(0xUserAddress, 1000);  
   ```  
2. A user transfers 100 STK tokens to another address:  
   ```solidity  
   transfer(0xRecipientAddress, 100);  
   ```  
3. A user burns 50 STK tokens:  
   ```solidity  
   burn(50);  
   ```  

## License  

This project is licensed under the MIT License.
