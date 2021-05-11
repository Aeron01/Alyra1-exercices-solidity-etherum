// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract SimpleStorage {
  uint256 private _storedData;

  constructor (uint256 storedData_) {
    _storedData = storedData_;
  }

  function setStoredData(uint256 value) public {
    _storedData = value;
  }
 
  function storedData() public view returns(uint256) {
    return _storedData;
  }
}