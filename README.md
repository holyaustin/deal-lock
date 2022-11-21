# DEAL-LOCK
A new and efficient way to Time Lock Storage deals on Storage Providers in the Filecoin network.

This project intends to use a time lock actor on 4 simulated Filecoin storage deals (deals 67 - 70). The project will also allow users to store data in and retrieve data from the Filecoin network via deals. Participants in the network, miners (supply-side) and clients (demand-side), interact with each other via storage deals and retrieval deals. This DApp pulls out various variables of any deal once the time lock expires.

The project made use of the Solidity Mock API from Zondax which has both the MarketAPI and the MinerAPI with Common Libraries. A Timelock contract was created that interacts with Mock MarketAPI since the project objective was to interact with the storage deal, MarketAPI was the API of choice. The smart contracts were deployed to the Wallaby Testnet and interacted with.

The front end was built with Next.js and the interaction with the backend was achieved with ethers.js.

# FEVM Hardhat Kit

Deal-Lock deployed to 0x3E34Af21fC4b97B500aB17fc814cA2AF23431AC0

✔ Choose what to do with the pending transaction: · continue waiting

Compiled 2 Solidity files successfully

Wallet Ethereum Address: 0xa6D6f4556B022c0C7051d62E071c0ACecE5a1228

Wallet f4Address:  f410fu3lpivllaiway4cr2yxaohakz3hfueri6eecg6i

deploying "SimpleCoin" (tx: 0xbafc9e718ad3bbb12d8290aac29c11ad4199bc86aec3920cf8d8748cb01068fd)

deployed at 0x0046e9FA8BD67894FcB0DdC82C63727Af0D8f6dd 

with 30603179 gas 

reusing "MinerAPI" at 0xa2facd3d698c5102d04345f9c527c78b36229faf

deploying "MarketAPI" (tx: 0xa89b454efd90ae05f222faadcc75edaf83d1e2761b9c528ed4c84ad5fa3ed3c4)...: 

deployed at 0xC35A0a19857945cE7AbCA072D60617f5C921D003 

with 181272464 gas

deploying "Deallock" (tx: 0xa89b454efd90ae05f222faadcc75edaf83d1e2761b9c528ed4c84ad5fa3ed3c4)...: 

deployed at 0x3E34Af21fC4b97B500aB17fc814cA2AF23431AC0

with 181272464 gas

Done in 184.94s.
 \

## Cloning the Repo

Open up your terminal (or command prompt) and navigate to a directory you would like to store this code on. Once there type in the following command:

```
git clone https://github.com/filecoin-project/FEVM-Hardhat-Kit.git
cd FEVM-hardhat-kit
yarn install
```

This will clone the hardhat kit onto your computer, switch directories into the newly installed kit, and install the dependencies the kit needs to work.


## Get a Private Key

You can get a private key from a wallet provider [such as Metamask](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key).


## Add your Private Key as an Environment Variable

Add your private key as an environment variable by running this command: 
 
 ```
export PRIVATE_KEY='abcdef'
```

If you use a .env file, don't commit and push any changes to .env files that may contain sensitive information, such as a private key! If this information reaches a public GitHub repository, someone can use it to check if you have any Mainnet funds in that wallet address, and steal them!


## Get the Deployer Address

Run this command:
```
yarn hardhat get-address
```

The f4address is the filecoin representation of your Ethereum address. This will be needed for the faucet in the next step.

The Ethereum address will be used otherwise.


## Fund the Deployer Address

Go to the [Wallaby faucet](https://wallaby.network/#faucet), and paste in the f4 address we copied in the previous step. This will send some wallaby testnet FIL to the account.


## Deploy the SimpleCoin Contract

Type in the following command in the terminal: 
 
 ```
yarn hardhat deploy
```

This will compile the contract and deploy it to the Wallaby network automatically!

Keep note of the deployed contract address for the next step.

If you read the Solidity code for SimpleCoin, you will see in the constructor our deployer account automatically gets assigned 10000 SimpleCoin when the contract is deployed.


## Read your SimpleCoin balance

Type in the following command in the terminal: 
 
 ```
yarn hardhat get-balance --contract 'THE DEPLOYED CONTRACT ADDRESS HERE' --account 'YOUR F4 ADDRESS HERE'
```

The console should read that your account has 10000 SimpleCoin!
