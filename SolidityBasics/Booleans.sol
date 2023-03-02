//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract SampleBoolean {
    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = !_myBool;
    }
}
