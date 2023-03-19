//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

// Integers and unsigned integers are full numbers, meaning they have no decimal places.
// And the difference between unsigned and signed industries is the sign ones can go to negative, while
// the unsigned integers only range from zero to something really large. How large can they go?
// They can go between two to the power of 8 to 2 to the power of 256 minus one.
// So from 256 from 0 to 256, and from 0 to 2 to the power of 256 minus one.

// So if you're changing the compiler version to 7.5.
// And it's going to take a little bit because it needs to download the compiler and then it can compile it.
// So if you're using an older compiler version and if it incremented, oh, certainly it works.
// And now what is the value? The value is really large.
// The value is the the max unsigned integer value of a is basically two to the power of 256 minus one.
// That is the value over here, or at least it should be.
// And in version 0.8, they changed this behavior to from an unchecked arithmetic operation to a checked arithmetic operation.
// So there will be after compilation, there will be an additional check inside the byte code to make
// sure that the decrement increment, the arithmetic operations are not rolling over the the integer or
// the unsigned integer or whatever variable it is.
// So in order to get this behavior back from the unsigned, unchecked behavior back, you actually have
// to wrap it in an unchecked. BLOCK. That looks like this.
// And now if you're running in 0.8, 15 or 14 or anything larger than 0.80.
// If you're going to deploy this one. My unit is zero.
// If we are incrementing suddenly it is also working because it's just wrapping around the value.
// Now if we are, for whatever reason, wanting to mix and match this, then you can only for specific
// functions where you specifically want to have this behavior, wrap the arithmetic operation in an unchecked block.
// And that's basically how it works.

contract ExampleIntegers {
    uint public myUint; // 0 --> (2^256)-1 uint by default is defined as uint256

    uint8 public myUint8 = 250; // 0 --> 255

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUintUnchecked() public {
        // So in order to get this behavior back from the unsigned, unchecked behavior back, you actually have
        // to wrap it in an unchecked. BLOCK. That looks like this.
        unchecked {
            myUint--;
        }
    }

    // normal decrement Uint
    function decrementUint() public {
        myUint--;
    }

    function incrementUint8() public {
        myUint8++;
    }
}
