// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Functionality
// Only contract owner should be able to mint tokens
// Any user can transfer tokens
// Any user can burn their own tokens

contract StakeToken is ERC20, ERC20Burnable, Ownable {
    constructor(address initialOwner) 
        ERC20("StakeToken", "STK")
        Ownable(initialOwner)
    {}

    // Mint tokens - restricted to the contract owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transfer tokens - allows token transfers
    function transfer(address _to, uint256 _value) public override returns (bool) {
        _transfer(msg.sender, _to, _value); 
        return true;
    }

    // Burn tokens - allows users to burn their own tokens
    function burn(uint256 amount) public override {
        _burn(msg.sender, amount);
    }
}
