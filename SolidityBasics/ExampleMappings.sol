// SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract ExampleMapping {
    mapping(uint => bool) public myMapping; // the uint is the key and the bool is the value
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) public uintUintBoolMapping;

    // how myMapping will internally work
    // function myMapping (uint _key) view public returns (bool){
    //     return myMapping[_key];
    // }

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddress() public {
        myAddressMapping[msg.sender] = true;
    }

    //mapping of mappings
    function setUintUintBoolMapping(
        uint _key1,
        uint _key2,
        bool _value
    ) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}
