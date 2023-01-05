pragma solidity >=0.5.0 < 0.9.0;
contract lottery
{
    address public manager;
    address payable [] public participants;

    constructor()
    {
        manager=msg.sender;//perm to manager
    }
    receive () external payable{

        participants.push(payable(msg.sender));
    }
    function getbalance() public view returns(uint)
    {
        require(msg.sender==manager);
        return address(this).balance;
    }
    function random () public view returns(uint)
    {
         return  uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }  
    function seletwinner ()public view returns
    {
        
    }
}