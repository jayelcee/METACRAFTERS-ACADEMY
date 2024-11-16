// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SkillPledge {
    struct Pledge {
        uint256 amount;
        string skill;
        bool claimed;
    }

    address public owner;
    address public moderator;
    address public communityLeader;
    uint256 public communityFund;
    mapping(address => Pledge) public pledges;

    // Events
    event PledgeMade(address indexed user, uint256 amount, string skill);
    event SkillVerified(address indexed user, string skill);
    event PledgeClaimed(address indexed user, uint256 amount);
    event CommunityFundWithdrawn(address indexed leader, uint256 amount);

    // Set owner as deployer, and assign moderator and community leader
    constructor(address _moderator, address _communityLeader) {
        owner = msg.sender;
        moderator = _moderator;
        communityLeader = _communityLeader;
    }

    // Function for users to pledge funds toward learning a skill
    function makePledge(string memory skill) public payable {
        require(msg.value > 0, "Pledge amount must be greater than zero");
        require(bytes(skill).length > 0, "Skill cannot be empty");
        require(pledges[msg.sender].amount == 0, "Pledge already made");

        pledges[msg.sender] = Pledge(msg.value, skill, false);
        emit PledgeMade(msg.sender, msg.value, skill);
    }

    // Function to request skill verification from the moderator
    function verifySkill(address user) public {
        require(msg.sender == moderator, "Only the moderator can verify skills");
        require(pledges[user].amount > 0, "No pledge found for this user");
        require(!pledges[user].claimed, "Pledge already verified");

        pledges[user].claimed = true;
        emit SkillVerified(user, pledges[user].skill);
    }

    // Function for users to claim their funds if skill verified
    function claimPledge() public {
        Pledge storage pledge = pledges[msg.sender];
        require(pledge.amount > 0, "No pledge found");
        require(pledge.claimed, "Skill not verified");

        uint256 amount = pledge.amount;
        pledge.amount = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        if (!success) {
            revert("Claim failed. Try again.");
        }
        emit PledgeClaimed(msg.sender, amount);
    }

    // Function to forfeit the pledge to the community fund if unclaimed
    function forfeitPledge() public {
        Pledge storage pledge = pledges[msg.sender];
        require(pledge.amount > 0, "No pledge found");
        require(!pledge.claimed, "Pledge already claimed");

        uint256 amount = pledge.amount;
        pledge.amount = 0;
        communityFund += amount;
        
        // Assert that community fund has been updated correctly
        assert(communityFund >= amount);
    }

    // Function for community leader to withdraw from community fund
    function withdrawCommunityFund() public {
        require(msg.sender == communityLeader, "Only the community leader can withdraw");

        uint256 amount = communityFund;
        communityFund = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        if (!success) {
            revert("Community fund withdrawal failed.");
        }
        emit CommunityFundWithdrawn(msg.sender, amount);
    }

    // View function to get contract's total balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}