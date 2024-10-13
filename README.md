# Smart contract

## Transactions
## Blocks
    - Deal with: "double-spend attack"
    The transactions will be bundled into what is called "blocks" and then they will be executed and distributed among all participating nodes.
    If two transactions contradict each other, the one that ends up being second will be rejected and not become part of the block.

## The Ethereum Virtual Machine
    - Runtime enviroment for smart contracts in Ethereum.
    -> code running inside the EVM has no access to network, filesystem or other processed. 

## Accounts
    - Two kinds of accounts in Ethereum -> share the same space:
    
        + External accounts: are controlled by public-private key pairs.
        + Contract accounts: are controlled by the code stored together with the account.

        + External accounts address: determined from the public key.
        + Contract accounts address: determined at the time the contract is created (it is derived from the creator address and the number of transactions sent from that address, the so-called "nonce").

    - Every account has a persistent key-value store mapping 256-bit words to 256-bit words called storage.

    - 1 ether  = 10**10 wei

## Transactions
## Gas
    - Each transaction is charged with a certain amount of gas that has to be paied for by the originator of the transaction (tx.origin).
    - EVM executes transaction -> the gas is gradually depleted according to specific rules.
        => If the gas is used up at any point => an out-of-gas exceptions is triggerd => ends execution and reverts all modifications made to the state in the current call frame.
    
    - Each block has a maximum amount of gas, it also limits the amount of work needed to validate a block.

    - Gas price: set by the originator of the transaction, who has to pay: gas price * gas

## Storage, Memory and the Stack
    - EVM has three areas => store data: storage, memory and the stack

    - An account has a data area => storage - is persistent between function callls and transactions.
    - Storage: key-value store => maps 256-bit words to 256-bit words.
        -> costly to access => should minimize what u store in persistent storage to what the contract needs to run.

    - Memory: a contract obtains a freshly cleared instance for each message call.
    - Linear and can be addressed at byte level
        => but reads are limited to a width of 256 bits, while writes can be either 8 bits or 256 bits wide.  

    - EVM = stack machine
        => all computations are performed on a data area called the stack.
    - It has a maximum size of 1024 elements and contains words of 256 bits. 

## Instruction Set
## Message Calls
    - Contracts can call other contracts or send Ether to non-contract accounts by the means of message calls

    - A contract can decide how much of its remaining gas should be sent with the inner message call and how much it wants to retain.

    - Calls are limited to a depth of 1024, which means that for more complex operations, loops should be preferred over recursive calls.

## Delegatecall and Libraries
    - a special variant of a message call - delegatecall: identical to a message call. 

## Logs
    - It is possible to store data in a specially indexed data structure that maps all the way up to the block level. 

    - Contracts cannot access log data after it has been created, but they can be efficiently accessed from outside the blockchain.

## Create
## Deactivate and Self-destruct
    - The only way to remove code from the blockchain is when a contract at that address performs the selfdestruct operation.
    

 