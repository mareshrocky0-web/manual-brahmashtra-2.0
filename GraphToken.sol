// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract GraphToken {
    string public name = "Graph Token";
    string public symbol = "GRT";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public governor;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _initialSupply) {
        governor = msg.sender;
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;
    }

   
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        return true;
    }

   
    function mint(address _to, uint256 _amount) public {
        require(msg.sender == governor, "Only governor can mint");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
    }
}
