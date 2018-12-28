pragma solidity ^0.4.2;

contract TjToken{

  string public name = "Tj Token";

  string public symbol = "Tj";
  string public standard = "Tj Token v0.1";
  uint256 public totalSupply;

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  event Approve(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );

  mapping(address => uint256) public balanceOf;
  mapping(address => mapping(address=>uint256)) public allowance;

  constructor (uint256 _initalSupply)public {
    balanceOf[msg.sender] = _initalSupply;
    totalSupply = _initalSupply;
  }


  function transfer(address _to, uint256 _value) public returns (bool success){
    require (balanceOf[msg.sender] >= _value);

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){

    require(_value <= balanceOf[_from]);
    require(_value <= allowance[_from][msg.sender]);

    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;


    allowance[_from][msg.sender] -= _value;

    emit Transfer(_from, _to, _value);

    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success){
    allowance[msg.sender][_spender] = _value;
    emit Approve(msg.sender, _spender, _value);
    return true;
  }

}
