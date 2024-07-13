// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DegenToken is ERC20 {
    address public owner;
    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}