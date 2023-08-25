// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title A Sample Raffle Contract
 * @author Sahil Bansal
 * @notice this contract is for creating a sample raffle contract\
 * @dev Implements chainlink VRFv2  
 */

contract Raffle {
    error Raffle__NotEnoughEthSent();

    uint256 private immutable i_entranceFee;
    address payable [] private s_players;



    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() external payable{
        // require(msg.value >= i_entranceFee, "Enough_eth_sent"); // less get efficient
        if (msg.value < i_entranceFee) {    //more gas efficient
            revert Raffle__NotEnoughEthSent();
        }

        s_players.push(payable(msg.sender));
    }

    function pickWinner()  public {
        
    }

    /**Getter Functions */

    function getEntranceFees()  external view returns(uint256) {
        return i_entranceFee;
    }

}