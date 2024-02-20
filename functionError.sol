// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setValue(uint256 _newValue) external onlyOwner {
        
        require(_newValue > 0, "New value must be greater than zero");
        
        assert(_newValue <= type(uint256).max);

        if (_newValue == 42) {
            revert("The new value cannot be 42");
        }

        value = _newValue;
    }
}
