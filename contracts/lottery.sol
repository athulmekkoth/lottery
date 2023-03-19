pragma solidity >=0.5.0 < 0.9.0;
contract lottery
{
    address public manager;
    address payable [] public participants;
address payable public winner;
    constructor()
    {
        manager=msg.sender;//perm to manager
    }
    receive () external payable{

        participants.push(payable(msg.sender));
    }
    function getBalance() public view returns(uint)
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
        require (participants.length >= 3);

        uint r = random();
        


        uint index = r % participants.length;

        winner = participants[index];

        winner.transfer(getBalance());


       participants = new address payable[](0);
    }
    function alllplayers()  public view returns(address payable[] memory)
    {
        return participants;
    }

}
