// SPDX-License-Identifier:MIT
pragma solidity 0.8.14;

// contract ExampleMappingWithdrawals {

//     mapping(address => uint) public balanceReceived;

//     function sendMoney () public payable {
//
//     }

//     function getBalance() view public returns(uint){
//         return address(this).balance;
//     }

//     function withdrawAllMoney (address _withdrawAddress) public {
//         payable(_withdrawAddress).transfer(getBalance());

//     }
// }

// can we make the contract above kind of like inherently secure by tracking who deposited what
// and just let people withdraw as much as they deposited before?
// And there's actually a way and there's an elegant way, instead of a dozens of different variables and
// elegant ways to use a mapping that tracks the balances received.
// So let's improve the smart contract.

contract ExampleMappingWithdrawals {
    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Instead of letting the user withdraw the amount of money that is in total in the smart contract, we
    // will just let him withdraw the amount of money that is was sent.
    // To buy this user to send money.
    // So what He can withdraw is What is basically in here.

    //     function withdrawAllMoney (address _withdrawAddress) public {
    //         payable(_withdrawAddress).transfer(balanceReceived[msg.sender]);
    //         balanceReceived[msg.sender] = 0;

    //     }

    // That commented function above would do the valid thing, but here we would open it up to a sort of re entrance attack and it's,
    // it's, it's not really possible with the transfer function because it only gives you a minimum amount of gas, but.
    // In general, this is called the checks effects interactions pattern.
    // So what you should do, what you should not do is what is here.
    // And what you should do is first check if the user has enough balance.
    // But we don't really do that yet because we will see in the next few lectures about exceptions and require
    // statements and so on how this works and we can improve it there.
    // But then we are going to apply the effect and then have the interaction to an external address.
    // So instead of first setting out and then applying the zero, we first have to apply the zero and then
    // send it out because this address over here could call back into that smart contract.
    // And if it is possible to do that, then it could actually withdraw again before it gets set to zero.
    // And that is the problem with the re-entrancy attack happened on on the Dow, for example, which was one of the first voting and crowdfunding
    // smart contracts that got hacked that led to the split between Ethereum and the Ethereum classic.
    // Now, small thing can have a huge impact.
    // So how are we going to do that?
    // First of all, we are going to cache our value balance to send out is balance received.
    // Message sender then be set, balance, received, message sender zero
    // and then we are going to send out the balance.
    // To send out.
    // And this way, even if this smart contract or whatever is running here would be, for whatever reason,
    // be able to call back this function again.
    // At that point, the balance received would already be zero net.

    function withdrawAllMoney(address payable _withdrawAddress) public {
        uint balanceToBeSentOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _withdrawAddress.transfer(balanceToBeSentOut);
    }
}
