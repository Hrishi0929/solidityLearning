//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract BlockchainMessenger {
    // Now it's time to put together what we've learned into one project, one contract that is called the
    // blockchain messenger.
    // Just to repeat what it does is it can store a string on the blockchain.
    // It is readable for everyone, but it's writable only for the person who deployed the smart contract
    // in the first place.
    // Now you have everything in place.
    // You know what a strings, you know, what is the message sender
    // You know the addresses.
    // One more thing.
    // We also want to know how many times the message was updated.

    string public myMessage;
    // address public owner = msg.sender; ## we can do this or add a constructor that sets the owner to msg.sender
    address public owner;
    uint public counter;

    constructor() {
        owner = msg.sender;
    }

    function myMessenger(string memory myMmessage) public {
        require(
            msg.sender == owner,
            "The Owner of the contract is not the same as the contract deployer"
        );
        myMessage = myMmessage;
        counter++;
    }
}
