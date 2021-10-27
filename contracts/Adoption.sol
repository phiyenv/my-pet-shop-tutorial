pragma solidity ^0.5.16;


contract Adoption {
    //Contract variables
    address[16] public adopters; //unique type


    /* Function 1: Adopting a pet */
    function adopt(uint petId) public returns (uint){
        require(petId >= 0 && petId <= 15); // require() : statement to ensure the ID is within range
        
        adopters[petId] = msg.sender; // if the ID is in range, we add the address that made the call to our adopters array
        // The address of the person or smart contract who called this function is denoted by msg.sender
       
        return petId;
    } 

    /* Function 2 : Retrieving the adopters */ 
    function getAdopters() public view returns (address[16] memory){ //  memory gives the data location for the variale
    // view keyword means that the funtion will not modify the state of the contract 
        
        return adopters;
    }

}