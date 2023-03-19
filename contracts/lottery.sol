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
      function pickWinner() public{

        require(msg.sender == manager);
        require (players.length >= 3);

        uint r = random();
        address payable winner;


        uint index = r % players.length;

        winner = players[index];

        winner.transfer(getBalance());


        players = new address payable[](0);
    }

}
