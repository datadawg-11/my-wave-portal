// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    event NewWave(address indexed from, uint256 timestamp, string message); 
    
    struct Wave {
        address waver; 
        string message; 
        uint timestamp; 
    }

    Wave[] waves;

    constructor() {
        console.log("I AM A SMART CONTRACT. POG.");
    }

    function wave(string memory _message) public {
        totalWaves +=1 ;
        console.log("%s has waved!", msg.sender); 
        waves.push(Wave(msg.sender, _message, block.timestamp)); 

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
            return waves;
        }
    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }


}