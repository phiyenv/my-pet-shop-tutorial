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



}