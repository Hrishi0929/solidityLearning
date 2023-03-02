//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

// Integers and unsigned integers are full numbers, meaning they have no decimal places.
// And the difference between unsigned and signed industries is the sign ones can go to negative, while
// the unsigned integers only range from zero to something really large. How large can they go?
// They can go between two to the power of 8 to 2 to the power of 256 minus one.
// So from 256 from 0 to 256, and from 0 to 2 to the power of 256 minus one.

contract ExampleIntegers {
    uint public myUint; // 0 --> (2^256)-1 uint by default is defined as uint256

    uint8 public myUint8 = 250; // 0 --> 255

    int public myInt = -10; // -2^128 --> (2^128)-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        myUint--;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementInt() public {
        myInt++;
    }
}
