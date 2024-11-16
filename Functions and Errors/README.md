# FundChain Contract  

A Solidity smart contract designed to empower users to pledge funds for acquiring skills, with a structured system for verification, claims, and community contributions.  

## Description  

The **FundChain** contract enables users to pledge funds toward learning new skills. Once a skill is verified by a designated moderator, users can claim their pledged amount. Unclaimed funds are transferred to a community fund managed by a community leader, who can withdraw it for community initiatives.  

## Features  

- **Pledge System**: Users can pledge funds and specify the skill they wish to learn.  
- **Skill Verification**: A moderator verifies the skills of the users.  
- **Claim Funds**: Users can reclaim their pledged funds upon successful verification.  
- **Community Fund**: Unclaimed funds are added to a community fund for broader benefit.  
- **Controlled Withdrawals**: Only the designated community leader can withdraw the community fund.  

## Getting Started  

### Installation  

1. Use [Remix IDE](https://remix.ethereum.org/) or any Solidity-supported IDE.

### Deployment  

1. Set the moderator and community leader addresses during deployment.  
2. Fund the contract to allow users to interact.  

### Execution  

- **Make a Pledge**:  
  Users can call the `makePledge` function with a skill name and ETH amount.  
- **Verify Skill**:  
  The moderator calls `verifySkill(address user)` to verify a user’s skill.  
- **Claim Pledge**:  
  Users with verified skills can reclaim their pledged amount via `claimPledge()`.  
- **Forfeit Pledge**:  
  Unverified users can forfeit their pledge to the community fund using `forfeitPledge()`.  
- **Withdraw Community Fund**:  
  The community leader can withdraw the entire community fund via `withdrawCommunityFund()`.  

## Error Handling  

- **`require`**: Validates pledge conditions such as non-zero amounts and unique pledges.  
- **`revert`**: Ensures funds are returned if transactions fail.  
- **`assert`**: Confirms state integrity after community fund updates.  

## Contract Details  

- **Constructor**:  
  Sets the contract owner, moderator, and community leader.  

- **Public Functions**:  
  - `makePledge(string memory skill)`  
  - `verifySkill(address user)`  
  - `claimPledge()`  
  - `forfeitPledge()`  
  - `withdrawCommunityFund()`  
  - `getContractBalance()`  

- **Modifiers and Access Control**:  
  - Moderator-only access for skill verification.  
  - Community leader-only access for fund withdrawal.  

## License  

This project is licensed under the MIT License.  