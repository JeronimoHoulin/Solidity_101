pragma solidity 0.5.1;

/* esto
claro que esto también
y esto eson comentarios*/

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
    
    
    function addperson(string memory _firstname, string memory _lastname) public {   //memory es para la version 5
        people.push(person(_firstname, _lastname));
        
        peoplecount += 1;
        
    }
}



//agregar personas a un mapa
contract mycontract5 {
    uint256 public peoplecount;
    
    mapping (uint => person) public people;          // en vez de array [] es mapping
    
    
    struct person {
        uint _id;
        string _firstname;
        string _lastname;
    }
    
    
    function addperson(string memory _firstname, string memory _lastname) public {   
        peoplecount += 1;
        
        people[peoplecount] = person(peoplecount, _firstname, _lastname);         // ahora no lo indexamos po posicion sino id
        
    }
}


//agregar personas a un mapa
contract mycontract6 {
    uint256 public peoplecount;
    
    mapping (uint => person) public people;          
    
    
    struct person {
        uint _id;
        string _firstname;
        string _lastname;
    }
    
    
    function addperson(string memory _firstname, string memory _lastname) public {   //aca en vez de funcion publica vamos a hacer una interna debajo
        incrementcount();                                                           //que está escrita debjao pero se la llama acá
        people[peoplecount] = person(peoplecount, _firstname, _lastname);         
        
    }
    
    function incrementcount() internal {                                            //aca es la funcion interna, no visible al publico
        peoplecount += 1;
    }
}


//costum modifier so only certain people can call the add person funciton
//only an admin

contract mycontract7 {
    uint256 public peoplecount;
    
    mapping (uint => person) public people;          
    
    address owner;                 //aca defino el tipo de admin
    
                //el modificador, como funcion de que cosa puede hacer
    modifier onlyowner() {          
        require(msg.sender == owner);       //msg es algo implíicto de sol que le dá caractera un ser
        _;                                 //el requier le pide que lo que esté dentro dea true
    }
    
    struct person {
        uint _id;
        string _firstname;
        string _lastname;
    }
    
    constructor() public{
        owner = msg.sender;
        
    }
    
    
    function addperson(string memory _firstname, string memory _lastname) public onlyowner{      //acá la condicion que le define abajo
        incrementcount();                                                           
        people[peoplecount] = person(peoplecount, _firstname, _lastname);         
        
    }
    
    function incrementcount() internal {                                            
        peoplecount += 1;
    }
}


// working with time in sol
//only add person if time has passed or while open, not before

contract mycontract8 {
    uint256 public peoplecount;
    
    mapping (uint => person) public people;          

    uint256 openingtime = 1620699775;      //aca defino el timepo con unix epic time ... que es segundos desde un momento pasado del timepo..le sumo segundos q quiera a ese num
    //hasta que la fecha de hoy no supere esos segundos que le agregamos en el futuro el contrato no se vá a ejercer.
                             //el modificador, como funcion de que cosa puede hacer
    modifier onlywhileopen() {          
        require(block.timestamp >= openingtime);       //block.timestamp es una funcion de hoy
        _;                                 //el requier le pide que lo que esté dentro dea true
    }
    
    struct person {
        uint _id;
        string _firstname;
        string _lastname;
    }
    
    
    
    function addperson(string memory _firstname, string memory _lastname) public onlywhileopen{      //acá la condicion que le define abajo
        incrementcount();                                                           
        people[peoplecount] = person(peoplecount, _firstname, _lastname);         
        
    }
    
    function incrementcount() internal {                                            
        peoplecount += 1;
    }
}
