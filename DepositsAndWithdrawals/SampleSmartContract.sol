//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract SampleContract {
    string public myString = "Hello World!!";

    // we see here that we can store money in an address and we can put some conditions and then
    // make sure that the money is sent back to the msg.sender if the conditions are not met

    // when sending ether to a contract we need to modify the function to payable
    function updateString(string memory _myString) public payable {
        // now after sending ether to a contract it will be locked inside the smart contract to remove that from the contract
        // to check how much ETH or value was sent to the smart contract then we can use the global msg object and use the value method on that
        if (msg.value == 1 ether) {
            //ether is already defined as 1**18 wei in solidity so we can use 1 ether directly
            myString = _myString;
        } else {
            // we can send money from the smart contract to an account
            payable(msg.sender).transfer(msg.value); // as we can see we get an error when we don't wrap the address in payable
            // so we need to make sure that the address that we are transferring to is payable
        }
    }
}
