// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * Anyone can send coins to each other without a need for registering
 * with a username and password. All we need is an Ethereum keypair
 */

contract Coin {
    address public minter;
    mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract is created
    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function
    error InsufficientBalance(uint requested, uint available);

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint amount) public {
        require(
            amount <= balances[receiver],
            InsufficientBalance(amount, balances[msg.sender])
        );
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
