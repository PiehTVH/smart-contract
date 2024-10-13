// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

contract Example {
    function f() public payable returns (bytes4) {
        assert(this.f.address == address(this)); // address: returns the address of the contract of the function
        return this.f.selector; // returns the ABI function selector
    }

    function g() public {
        this.f{gas: 10, value: 800}();
    }
}
