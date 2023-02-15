// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Multisend.sol";

contract CounterTest is Test {
    Multisend public multisend;
    address payable[] addrList = [payable(address(1337)), payable(address(1338)), payable(address(1339))];

    function setUp() public {
        multisend = new Multisend();
    }

    function testSend() public {
        multisend.multisend{value:9000000000000000000}(addrList, 3000000000000000000);
        assertEq(address(1337).balance, 3000000000000000000);
    }
}
