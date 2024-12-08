// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Errors is IErrors {
    address owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: You are not a owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}

error NotOwner();
contract ErrorsOptimized is IErrors {
    address immutable owner = msg.sender;

    modifier onlyOwner() {
        require(owner == msg.sender, NotOwner());
        _;
    }

    function call() public view onlyOwner {}
}
