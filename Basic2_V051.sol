pragma solidity 0.5.1;

//Write a function that accepts ETH
contract contract1 {

    //a wayto track a buytoken
    mapping(address => uint256) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {    
        //payable make this function accept ETH
        wallet = _wallet;
    }

    function buytoken() public payable{
        //buy a buytoken
        balances[msg.sender] += 1;  //will increment balance inside this ocntract by 1ETH of whoever called the function "msg.sender"
        wallet.transfer(msg.value); //the value of the msg.sender's wallet
        //send ETH to a wallet
        
    }
}

//fallback function
//default function here your wrap this contract in

contract contract2 {

    //a wayto track a buytoken
    mapping(address => uint256) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {    
        //payable make this function accept ETH
        wallet = _wallet;
    }
    
    function() external payable{  
        //external means it can only be called outside of the function public is in and out
        buytoken();
    }

    function buytoken() public payable{
        //buy a buytoken
        balances[msg.sender] += 1;  //will increment balance inside this ocntract by 1ETH of whoever called the function "msg.sender"
        wallet.transfer(msg.value); //the value of the msg.sender's wallet
        //send ETH to a wallet
        
    }
}

//Events in smart contracts, external consumers can know that a token has been purchased


contract contract3 {

    //a wayto track a buytoken
    mapping(address => uint256) public balances;
    address payable wallet;
    
    event purchase(
        address indexed _buyer,
        uint256 _amount
    );
    
    constructor(address payable _wallet) public {    
        //payable make this function accept ETH
        wallet = _wallet;
    }
    
    function() external payable{  
        //external means it can only be called outside of the function public is in and out
        buytoken();
    }

    function buytoken() public payable{
        //buy a buytoken
        balances[msg.sender] += 1;  //will increment balance inside this ocntract by 1ETH of whoever called the function "msg.sender"
        //send ETH to a wallet
        wallet.transfer(msg.value); //the value of the msg.sender's wallet

        emit purchase(msg.sender, 1);
        
    }
}


// multiple smart contracts
//one that will talk to the other, and enheritance

contract ERC20token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
        //msg sender is who called the contract, 
    }

}

//The contract that will mint the ERC20token contract

contract minting_cont {
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {    
        wallet = _wallet;
        token = _token;
    }// THE CONSTRUCTOR MAKES VARIABLES THAT THE CONTRACT NEEDS TO KNOW BEFORE DEPLOYING
    
    function() external payable{  
        buytoken();
    }

    function buytoken() public payable{
        ERC20token _token = ERC20token(address(token));
        _token.mint();
        //or ERC20token(address(token)).mint; 
        wallet.transfer(msg.value); 
    }
}
