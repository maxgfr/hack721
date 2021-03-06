pragma solidity ^0.4.24;
import "./Ownable.sol";
import "./Hack721Token.sol";
// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!
contract CareGame is Ownable {

    Hack721Token token;
    uint ethAmount;
    address receiver;
    uint amountToUnlock;

    function create (address addr, address p_receiver, uint p_ethAmount, uint p_amountToUnlock) public {
        token = Hack721Token(addr);
        receiver = p_receiver;
        ethAmount = p_ethAmount;
        amountToUnlock = p_amountToUnlock;
    }

    function checkAchievements() public {
        if (token.balanceOf(address(this)) >= amountToUnlock) {
            receiver.transfer(ethAmount);
        }
    }

    function () public payable {}
}
