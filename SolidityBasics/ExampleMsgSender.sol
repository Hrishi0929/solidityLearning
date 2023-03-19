//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract ExampleMsgSender {
    address public someAddress;

    function updateSomeAddress() public {
        // msg object is a public object that's available throughout the contract
        // sender is a property of the msg object who is the person that's interacting with the smart contract
        someAddress = msg.sender;
    }
}
