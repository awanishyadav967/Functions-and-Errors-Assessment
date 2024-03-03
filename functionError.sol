// SPDX-License-Identifier: MIT
//Author-Avanish
pragma solidity ^0.8.0;

contract EnhancedContract {
    address public creatorAddress;
    uint256 public storedData;

    constructor() {
        creatorAddress = msg.sender;
    }

    modifier onlyCreator() {
        require(msg.sender == creatorAddress, "Only the creator can call this function");
        _;
    }

    function updateStoredData(uint256 newValue) external onlyCreator {
        // Ensure the new stored data is a positive number
        require(newValue > 0, "New stored data must be greater than zero");

        // Use assert to check if the new stored data is within the allowed range
        assert(newValue <= type(uint256).max);

        // Prohibit setting the stored data to 42
        if (newValue == 50) {
            revert("The new stored data cannot be 50");
        }

        // Update the stored data value
        storedData = newValue;
    }
}
