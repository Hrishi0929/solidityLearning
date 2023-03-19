//SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

contract ExampleAddress {
    address public someAddress;

    function setAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    //check balance of an address
    function getAddressBalance() public view returns (uint256) {
        // this will return the address in wei and all the denominations in a smart contract will be in wei
        return someAddress.balance;
    }
}
