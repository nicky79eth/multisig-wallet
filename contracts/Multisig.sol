// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Multisig {

    address[] public owners;
    uint public required;

    struct Transaction {
        address to;
        uint value;
        bool executed;
        uint approvals;
    }

    Transaction[] public transactions;
    mapping(uint => mapping(address => bool)) public approved;

    constructor(address[] memory _owners, uint _required) {
        owners = _owners;
        required = _required;
    }

    modifier onlyOwner() {
        bool isOwner = false;
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == msg.sender) {
                isOwner = true;
            }
        }
        require(isOwner, "Not owner");
        _;
    }

    function submitTransaction(address _to, uint _value) public onlyOwner {
        transactions.push(Transaction(_to, _value, false, 0));
    }

    function approveTransaction(uint txId) public onlyOwner {

        require(!approved[txId][msg.sender], "Already approved");

        approved[txId][msg.sender] = true;
        transactions[txId].approvals += 1;
    }

    function executeTransaction(uint txId) public {

        Transaction storage transaction = transactions[txId];

        require(transaction.approvals >= required, "Not enough approvals");
        require(!transaction.executed, "Already executed");

        transaction.executed = true;

        payable(transaction.to).transfer(transaction.value);
    }

    receive() external payable {}
}
