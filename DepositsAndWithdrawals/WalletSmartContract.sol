// And what it essentially does is when we have our account.
// Then we want to be able to.
// Send one ETH to the smart contract.
// And we want to be able to see the balance.
// And we want to be able to Withdraw from the smart contract and then also withdraw to a specific address.
// all of that is going to be in eth.
// What you need to do is some sort of deposit functionality, some sort of function to see how much balance
// balance is actually stored in the smart contract and withdraw.
// Let's say withdraw all function and a withdrawal to address function.

// SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract WalletSmartContract {
    // address public specificAddress;
    // uint public valueSent;
    uint public totalBalance;
    uint public valueThatNeedsToBeReturned;

    function deposit() public payable {
        totalBalance += msg.value;
    }

    function withdrawFromSmartContract() public payable {
        payable(msg.sender).transfer(checkBalance());
    }

    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawToASpecificAddress(
        address _specificAddress,
        uint _valueSent
    ) public payable {
        payable(_specificAddress).transfer(_valueSent);
    }
}
