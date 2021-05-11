// SPDX-License-Identifier: MIT
//Renkeby
//num account : 0x87dfC1491c3853FbCa17C09c67e70872fD111274
//num contrat : 0x87c668a5aab4aab8bca091513f2c764d8260d06c
// contrat deployer mais semble ne pas fonctionner correctement et payable non fonctionnelle (je suis sur qu'il manque quelques choses)

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

pragma solidity ^0.8.0;

contract PayableCalculator {
   
    function add(int256 numb1, int256 numb2) public payable returns (int256) {
        return numb1 + numb2;
        
    }
    
    function sub(int256 numb1, int256 numb2) public payable returns (int256) {
        return numb1 - numb2;
        
    }
    
    function mul(int256 numb1, int256 numb2) public payable returns (int256) {
        return numb1 * numb2;
        
    }
    
    function div(int256 numb1, int256 numb2) public payable returns (int256) {
        require(numb2 != 0, "payableCalculator: can not divide by 0");
        return numb1 / numb2;
        
    }
    
}