pragma solidity 0.5.1;

//constant value
contract mycontract2 {
    string public constant value = "My Value";
    
    bool public mybool = true;
    
    int public myint = - 1;
    
    uint public myuint = 1;
    
    uint8 public myuint8 = 8;
}

//enu <- enumerated list
// activate será una funcion que activa el state
contract mycontract3{
    enum State { Waiting, Ready, Active }
    State public state;
    
    constructor() public {
        state = State.Waiting;
    }
    
    function activate() public {
        state = State.Active;
    }
    
    function isactive() public view returns(bool) {
        return state == State.Active;
    }
}

//agregar personas a una lista
contract mycontract4 {
    
    person[] public people;
    
    uint256 public peoplecount;
    
    
    struct person{
        string _firstname;
        string _lastname;
    }
    
    
    function addperson(string memory _firstname, string memory _lastname) public {
        people.push(person(_firstname, _lastname));
        
        peoplecount += 1;
        
    }
}
