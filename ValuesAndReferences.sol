// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Data Types - values and references

contract ValueTypes {
    bool public b = true;
    uint public u = 123; // unsigned integer
    // uint = uint256 it ranges from 0 to 2**256 -1
    // uint8 it ranges from 0 to 2**8 -1
    // uint16 it ranges from 0 to 2**16 -1

    int public i = -123; // int = int256 ranges from -2**255 to 2**255 -1
    // int = int128 ranges from -2**127 to 2**127 -1

    // getting the range of int can be tricky so we can use this to get the range
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x6C4620f78Ebb508Cd46d892e1d35be357bD4Ead7; //random address
    bytes32 public b32 =
        0x626c756500000000000000000000000000000000000000000000000000000000; //random 32 bytes
}
