// Define an array to hold the NFT collection
let myNFTs = [];

// Function to create and mint a new NFT with given metadata parameters
function mintNFT (_name, _protocol, _assetType, _interestRate, _riskLevel) {
   const NFT = {
      "name": _name,
      "protocol": _protocol,
      "assetType": _assetType,
      "interestRate": _interestRate,
      "riskLevel": _riskLevel
   };
   myNFTs.push(NFT);
   console.log(`Minted: ${_name} (Protocol: ${_protocol}, Type: ${_assetType}, Risk: ${_riskLevel})`);
}

// Function to list all NFTs in the collection with their details
function listNFTs() {
   myNFTs.forEach((NFT, index) => {
       console.log(`\nNFT ID\t\t\t: ${index + 1}`);
       console.log(`Name\t\t\t: ${NFT.name}`);
       console.log(`Protocol\t\t: ${NFT.protocol}`);
       console.log(`Asset Type\t\t: ${NFT.assetType}`);
       console.log(`Interest Rate\t: ${NFT.interestRate}`);
       console.log(`Risk Level\t\t: ${NFT.riskLevel}`);
   });
}

// Function to print and return the total supply of NFTs
function getTotalSupply() {
   console.log(`\nTotal NFTs Minted: ${myNFTs.length}`);
   return myNFTs.length;
}

// Mint example NFTs and demonstrate the collection's functionality
mintNFT("UniPool Token", "Uniswap", "Liquidity Pool Token", "Variable", "Medium");
mintNFT("Aave Governance Coin", "Aave", "Governance Token", "Fixed", "Low");
mintNFT("Compound Yield Booster", "Compound", "Yield Farming Token", "Compounded", "High");
mintNFT("Sushi Staker", "SushiSwap", "Staking Token", "Zero", "Very High");
mintNFT("UniGovern Token", "Uniswap", "Governance Token", "Variable", "Low");

// List all NFTs and display the total supply
listNFTs();
getTotalSupply();
