//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract ExampleConstructor {
    // this will end up assigning myAddress to msg.sender straight away
    // address public myAddress = msg.sender;
    address public myAddress;

    // But if you want to assign it directly at the deployment time to another address, then we would have to actually call two transactions.
    // So we cannot we cannot make this a variable that is assigned during deployment.
    // We would have to deploy this, but this is exactly where the constructors are coming in.
    // So what is a constructor?
    // A constructor is a function, a special function that is called constructor.
    // It doesn't have the function keyword and it accepts any kind of arguments, some address, it has no
    // visibility specified and it just has curly brackets.
    // And the special thing about the constructor is it is directly called during deployment of a smart contract
    // and it is called only once and cannot be called afterwards.
    // Again, it cannot be overloaded, which is something we might dig into later.
    // And it can it is automatically called.

    constructor(address _someAddress) {
        myAddress = _someAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    // setting myAddress to msg.sender address
    function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }
}
