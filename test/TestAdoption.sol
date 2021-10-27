pragma solidity ^0.5.16;


/*
    ☾ Assert.sol: Checks for things like equality, inequality or emptiness to return a pass/fail from our test.  
    ☾ DeployedAddresses.sol: When running tests, Truffle will deploy a fresh instance of the contract being tested to the blockchain. This smart contract gets the address of the deployed contract. 
    ☾ Adoption: The smart contract we want to test.
 */

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


contract TestAdoption {
// The address of the adoption contract to be tested
Adoption adoption = Adoption(DeployedAddresses.Adoption());

// The id of the pet that will be used for testing
uint expectedPetId = 8;

//The expected owner of adopted pet is this contract
address expectedAdopter = address(this);

// Testing the adopt() funtion
function testUserCanAdoptPet () public {
    uint returnedId = adoption.adopt(expectedPetId);

  Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
}

// Testing retrieval of a single pet's owner
function testGetAdopterAddressByPetId () public {
    address adopter = adoption.adopters(expectedPetId);

    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
}

// Testing retrieval of all pet owners
function testGetAdopterAdressByPetIdArray () public {
// Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expectedPetId],expectedAdopter, "Owner of the expected pet should be this contract");
    
}


}