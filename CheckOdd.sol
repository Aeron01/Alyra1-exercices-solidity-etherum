// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
  function check(uint256 number_ ) public pure returns (bool) {
    if(number_ % 2 == 0) {
      return  false;
    } else {
      return true;
    } 
  }
}


// correction

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract CheckOdd {
  function check(uint256 number) public pure returns (bool) {
    return number % 2 == 0 ? false : true;
  }
}