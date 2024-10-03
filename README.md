# DegenToken 

An ERC20 based token deployed on avalanche testnet fuji C-Chain

## Description

This project demostrate how to deploy in fuji c-chain using solidity 

we were sucessfully abled to fulfill our requirements.

## Challenges

Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.

Transferring tokens: Players should be able to transfer their tokens to others.

Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.

Checking token balance: Players should be able to check their token balance at any time.

Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

### Installing

* Fork this repo , and do `npm install`
* create a `dot env` which should contain your `[private key and snowtrace api key]`

### Alternatively

You can copy `DegenToken.sol` file in remix ide . 

and use avalanche fuji network to deploy the code.

Also read `Guide.md ` for thorough setup.

## Contract Details

- **Token Name**: `DegenToken`
- **Token Symbol**: `DGN`
- **Token Standard**: ERC-20, with burnable tokens.
- **Compiler Version**: Solidity 0.8.9
- **License**: MIT

## Contract Functions

### Owner-Only Functions

1. **mint(address to, uint256 amount)**
   - Mints new `DGN` tokens to the specified address.
   - Can only be called by the contract owner.
   - Emits a `TokensMinted` event.

2. **setItemCost(uint256 itemId, uint256 cost)**
   - Sets the cost for a specific item identified by `itemId`.
   - Can only be called by the owner.

3. **transferOwnership(address newOwner)**
   - Transfers ownership of the contract to a new address.
   - Emits an `OwnershipTransferred` event.

### Public Functions

1. **getBalance()**
   - Returns the balance of `DGN` tokens for the calling address.

2. **transferTokens(address _receiver, uint256 _value)**
   - Transfers `_value` number of `DGN` tokens from the caller to `_receiver`.
   - Emits a `TokensTransferred` event.

3. **redeemTokens(uint256 itemId)**
   - Redeems `DGN` tokens for an item with a specified `itemId`. The cost of the item is determined by the contract owner using `setItemCost`.
   - Burns the tokens used for redemption.
   - Emits a `TokensRedeemed` event.

4. **burnTokens(uint256 _value)**
   - Burns `_value` number of `DGN` tokens from the caller's account.

## Events

- **TokensMinted(address indexed to, uint256 amount)**
   - Emitted when new tokens are minted.

- **TokensTransferred(address indexed from, address indexed to, uint256 amount)**
   - Emitted when tokens are transferred between users.

- **TokensRedeemed(address indexed player, uint256 itemId)**
   - Emitted when a user redeems tokens for an item.

- **OwnershipTransferred(address indexed oldOwner, address indexed newOwner)**
   - Emitted when the ownership of the contract is transferred.

// Set the cost of item with ID 1 to 100 DGN tokens
setItemCost(1, 100);

// Redeem tokens for item with ID 1
redeemTokens(1);

// Transfer ownership to a new address
transferOwnership(0xDEF...);


### Explanation:

- **Features** section summarizes the functionality of the contract.
- **Contract Functions** gives a breakdown of the public and owner-only functions, describing their behavior and any events emitted.
- **Events** details the various events emitted by the contract.
- **Deployment** provides basic instructions for installing dependencies and deploying the contract.
- **Usage Example** includes examples of how to interact with the contract.
  
