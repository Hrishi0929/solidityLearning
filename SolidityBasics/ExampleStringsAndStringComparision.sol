//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract ExampleStrings {
    string public myString = "Hello World!!!";
    bytes public mybytes = "Hello World";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function compareTwostrings(
        string memory _myString
    ) public view returns (bool) {
        // so basically we can't compare two strings so we need to encode the strings and hash them using keccak256
        return
            keccak256(abi.encodePacked(myString)) ==
            keccak256(abi.encodePacked(_myString));
    }
}
