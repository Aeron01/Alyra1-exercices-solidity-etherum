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

// correction

// SPDX-License-Identifier: MIT
//Renkeby
//num account : 0x87dfC1491c3853FbCa17C09c67e70872fD111274
//num contrat : 0x9049f11bb84539c98bf89673072aae6098ca6449


pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract PayableCalculator {
    using Address for address payable;
    
    address private _owner;
    uint256 private _counter;
    
    event Add(address indexed account, int256 numb1, int256 numb2, int256 res);
    event Sub(address indexed account, int256 numb1, int256 numb2, int256 res);
    event Mul(address indexed account, int256 numb1, int256 numb2, int256 res);
    event Div(address indexed account, int256 numb1, int256 numb2, int256 res);
    event Mod(address indexed account, int256 numb1, int256 numb2, int256 res);
    
    modifier onlyEgnouthEther() {
        require (msg.value >= 1e15, "PayableCalculator: operation cost 1 finney");
        _;
    }
    
    modifier onlyOwner() {
        require(msg.sender == _owner, "PayableCalculator : only owner");
        _;
    }
    
    constructor(address owner_) {
        _owner = owner_;
    }
    
    function withdraw() external onlyOwner{
        payable(msg.sender).sendValue(address(this).balance);
    }
    
    function add(int256 numb1, int256 numb2) public payable returns (int256) {
        _counter++;
        emit Add(msg.sender, numb1, numb2, numb1 + numb2);
        return numb1 + numb2;
        
    }
    
    function sub(int256 numb1, int256 numb2) public payable returns (int256) {
        _counter++;
        emit Sub(msg.sender, numb1, numb2, numb1 - numb2);
        return numb1 - numb2;
        
    }
    
    function mul(int256 numb1, int256 numb2) public payable returns (int256) {
        _counter++;
        emit Mul(msg.sender, numb1, numb2, numb1 * numb2);
        return numb1 * numb2;
        
    }
    
    function div(int256 numb1, int256 numb2) public payable returns (int256) {
        _counter++;
        require(numb2 != 0, "payableCalculator: can not divide by 0");
        emit Div(msg.sender, numb1, numb2, numb1 / numb2);
        return numb1 / numb2;
        
    }
    
    function mod(int256 numb1, int256 numb2) public payable returns (int256) {
        _counter++;
        emit Mod(msg.sender, numb1, numb2, numb1 % numb2);
        return numb1 % numb2;
        
    }
    
    function owner() public view returns(address) {
        return _owner;
    }
    
    function couter() public view returns(uint256) {
        return _counter;
    }
    
}