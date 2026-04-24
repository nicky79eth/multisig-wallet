# Multisig Wallet

A simple multisignature wallet smart contract built with Solidity and Hardhat.

This project demonstrates how multiple owners can collectively manage funds by requiring a minimum number of approvals before executing a transaction. 

---

## Features

* Multiple wallet owners...
* Submit transactions...
* Approve transactions...
* Execute transactions after required approvals...

---

## Tech Stack

* Solidity
* Hardhat
* ethers.js
* Node.js

---

## Project Structure

```
multisig-wallet/
│
├── contracts
│   └── Multisig.sol
│
├── scripts
│   └── deploy.js
│
├── test
│   └── multisig.test.js
│
├── hardhat.config.js
├── package.json
├── .env.example
└── README.md
```

---

## Installation

Clone the repository

```
git clone https://github.com/your-username/multisig-wallet.git
cd multisig-wallet
```

Install dependencies 

```
npm install
```

---

## Compile Contracts

```
npx hardhat compile
```

---

## Run Tests

```
npx hardhat test
```

---

## Deploy Contract

```
npx hardhat run scripts/deploy.js --network localhost
```

---

## Future Improvements

* Transaction event logs.
* Owner management (add/remove owners).
* Frontend interface for transaction approvals 
* Gas optimization

---

## License

MIT
