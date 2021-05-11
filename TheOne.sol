// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TheOne {
  uint256 private _one;

constructor() {
    _one = 1;
}

function one () public view returns(uint256) {
    return _one;
  }
}