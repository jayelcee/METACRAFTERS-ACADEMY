# My NFT

This JavaScript project is a simple demonstration of how to create and manage a collection of NFTs (Non-Fungible Tokens) using plain JavaScript. The project is part of the **JS PROOF: Beginner Course** offered by Metacrafters. It teaches the fundamentals of object manipulation, array operations, and function implementation in JavaScript by simulating a dynamic NFT minting system.

---

## Description

This project allows users to mint NFTs with customizable metadata fields including the asset's name, protocol, type, interest rate, and risk level. Each NFT is stored as an object in an array, representing a growing collection. The program includes functionality to:

- Mint new NFTs with unique details  
- List all NFTs in the current collection  
- Display the total number of NFTs minted  

This simulation does **not** connect to a blockchain, but it lays a foundational understanding of how NFT metadata might be structured and managed.

---

Video Demo: https://www.loom.com/share/3b007a23113a4abfb0f0c0bb1957567d

---

## Getting Started

### Installing

1. Download or clone this repository from GitHub.
2. Open the `MyNFT.js` file in any text editor or JavaScript environment (e.g., VSCode, Replit, Node.js REPL).

---

### Executing Program

#### Run the Script:

1. Make sure you have Node.js installed.
2. Open a terminal in the project folder.
3. Execute the script with the command:

```bash
node MyNFT.js
```

#### Sample Output:

- The console will show minted NFT details.
- It will then list all NFTs in the collection.
- Finally, it will display the total NFT count.

Example usage inside the script:

```javascript
mintNFT("UniPool Token", "Uniswap", "Liquidity Pool Token", "Variable", "Medium");
mintNFT("Aave Governance Coin", "Aave", "Governance Token", "Fixed", "Low");
listNFTs();
getTotalSupply();
```

---

## Help

**Common Issue**:  
If you're not seeing any output or get an error like `ReferenceError: mintNFT is not defined`, make sure you are executing the script using Node.js and not in a browser console.

---

## Author

**Jasmine Camasura**  
FEU Institute of Technology  
