// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyToken {
    
    // Public variables to store token details
    string public name = "MyCustomToken";    // Token Name
    string public symbol = "MCT";            // Token Abbreviation
    uint public totalSupply = 0;             // Total Supply

    // Mapping to store balances of each address
    mapping(address => uint) public balances;

    // Function to mint new tokens
    function mint(address _to, uint _amount) public {
        totalSupply += _amount;              // Increase total supply
        balances[_to] += _amount;            // Add the amount to the recipient's balance
    }

    // Function to burn tokens
    function burn(address _from, uint _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance to burn");  // Check if enough balance exists
        totalSupply -= _amount;             // Decrease total supply
        balances[_from] -= _amount;         // Subtract the amount from the sender's balance
    }
}
