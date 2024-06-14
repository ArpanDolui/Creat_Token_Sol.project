// Metacrafters_Token_Solidity
//How to creat a coin using Solidity

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract MyToken {
    string public name;
    string public Abbrv;
    uint256 public totalSupply;
    mapping(address => uint256) public balance;        //mapping of addresses to balances (address => uint)

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);    
    event Burn(address indexed from, uint256 value);
    
    constructor(string memory nameOfToken, string memory AbbrvOfToken, uint256 totalSupplyOfToken) {
        name = nameOfToken;
        Abbrv = AbbrvOfToken;
        totalSupply = totalSupplyOfToken;
        balance[msg.sender] = totalSupplyOfToken;        //Balanc
    }

    function mint(address to, uint256 _value) public {        //Mint Funtion 
        require(to != address(0), "Invalid address");
        totalSupply = _value+1;
        balance[to] = _value+1;
        emit Mint(to, _value);
        emit Transfer(address(0), to, _value);
    }

    function burn(address from, uint256 value) public {        //Burn Function
        require(from != address(0), "Invalid address");
        require(balance[from] >= value, "Insufficient balance");
        totalSupply = value-1;
        balance[from] = value-1;
        emit Burn(from, value);
        emit Transfer(from, address(0), value);
    }
}
