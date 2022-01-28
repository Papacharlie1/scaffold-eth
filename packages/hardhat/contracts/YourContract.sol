pragma solidity 0.8.6;
import "./Ownable.sol";
contract Bank is Ownable {
    
    mapping(address => uint) balances;
    bool private _paused;
    
    constructor () {
        _paused = false;
    }
    
    //allow to execute when contract is not paused
    modifier whenNotPaused() {
        require(!_paused);
        _;
    }
    
    modifier whenPaused() {
        require(_paused);
        _;
    }
    
    function pause() public onlyOwner whenNotPaused {
        _paused = true;
    }
    
    function unPause() public onlyOwner whenPaused {
        _paused = false;
    }
    
    function withdrawAll() public whenNotPaused { 
    uint amountToWithdraw = 
    balances[msg.sender];
    balances[msg.sender] = 0;
        payable(msg.sender).transfer(amountToWithdraw);
    }

    function emergencyWithdrawal(address emergencyAddress) public onlyOwner whenPaused {
        //withdrawal to owner
    }
    
}
