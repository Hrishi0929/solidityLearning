// SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract SampleFallbackAndReceive {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;

    // receive function receives Ether
    // if there's just value transferred without any data it will hit the receive function
    // if some data is being sent then the fallback function has to be defined

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    // It is generally called to receive calldata
    // fallback functions are generally called when a transaction with the wrong function signature is sent to the smart contract

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}

// https://www.udemy.com/course/blockchain-developer/learn/lecture/33845694#overview
// refer to this for further clarification the last part where they explain about the input data and
// the hash of the functions that are defined in the smart contract is damn interesting
