pragma  solidity ^0.4.24;

contract mycontract {
    string value;
    
    constructor() public {
        value = "My String Value";
    }
    
    
    function get() public view returns(string) {
        return value; 
    }
    
    function set(string _value) public {
        value = _value;
    }
    
}

//to remove the get function
contract mycontract1 {
    string public value;
    
    constructor() public {
        value = "My String Value";
    }
    
    function set(string _value) public {
        value = _value;
    }
    
}

