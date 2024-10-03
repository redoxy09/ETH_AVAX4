// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, ERC20Burnable {
    address public owner;
    mapping(address => uint256) public redeemedItems;
    mapping(uint256 => uint256) public itemCosts;

    // Events for logging actions
    event TokensMinted(address indexed to, uint256 amount);
    event TokensTransferred(address indexed from, address indexed to, uint256 amount);
    event TokensRedeemed(address indexed player, uint256 itemId);
    event OwnershipTransferred(address indexed oldOwner, address indexed newOwner);

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Minting new tokens; only the owner can mint
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    // Checking token balance
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Transferring tokens
    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient Degen Tokens");
        transfer(_receiver, _value);
        emit TokensTransferred(msg.sender, _receiver, _value);
    }

    // Set the cost of an item (itemId => cost)
    function setItemCost(uint256 itemId, uint256 cost) public onlyOwner {
        itemCosts[itemId] = cost;
    }

    // Redeeming tokens for items (dynamic item costs)
    function redeemTokens(uint256 itemId) external {
        uint256 itemCost = itemCosts[itemId];

        require(itemCost > 0, "Invalid item or cost not set");
        require(balanceOf(msg.sender) >= itemCost, "Insufficient Degen Tokens to redeem item");

        _burn(msg.sender, itemCost);
        redeemedItems[msg.sender] += itemId;

        emit TokensRedeemed(msg.sender, itemId);
    }

    // Burning tokens
    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient Degen Tokens to burn");
        burn(_value);
    }

    // Transfer ownership to a new address
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
