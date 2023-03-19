//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

// the difference between a view function and the pure function is that the view function can access
// storage variables or generally can access variables outside of the scope of the of the function, but it cannot write them.
// And the pure function can only call variables that are that are not storage variables or other pure functions.
// So in this case, we are just having the unsigned integer A and unsigned integer B as parameters and
// we are not using any other storage variables or view function or write anything.
// So this is the major difference between view and pure functions.

contract ExampleViewAndPure {
    uint public myStorageVariable;

    // A view function is a function that reads from the state but doesn't write to the state. A classic view function woule be a getter-function.

    function getMyStorageVariable() public view returns (uint) {
        return myStorageVariable;
    }

    // A pure function is a function that neither writes, nor reads from state variables. It can only access its own arguments and other pure functions.
    function getAddition(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // As you can see here, a writing function can have return variables,
    // but they won't actually return anything to the transaction initializer.
    // There are several reason for it, but the most prominent one is: at the time of sending the transaction the actual state is unknown.
    // It is possible that someone sends a competing transaction that alters the state and from there it only depends on the transaction ordering
    // which is something that happens on the miner side. You will see that extensively in the next section.
    // What's the return variable for then?
    // It's for Smart Contract communication. It is used to return something when a smart contract calls another smart contract function.
    // How to return variables then in Solidity? With Events! Something we're talking about later on.

    function setMyStorageVariable(
        uint _myStorageVariable
    ) public returns (uint) {
        myStorageVariable = _myStorageVariable;
        return _myStorageVariable;
    }
}
