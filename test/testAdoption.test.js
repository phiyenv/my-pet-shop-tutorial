// Importing the Adoption smart contract we want to test by using artifacts.require
const Adoption = artifacts.require("Adoption");

contract("Adoption", (accounts) => {
 let adoption;
 let expectedAdopter;

 //initial setups
 before(async () => {
     adoption = await Adoption.deployed();
 });

 /**
  * 
    ☾ Adopt a pet with id 8 and assign it to the first account within the test accounts on the network.
    ☾ This function later is used to check whether the petId: 8 has been adopted by accounts[0].

  */
 describe("adopting a pet and retrieving account addresses", async () => {
   before("adopt a pet using accounts[0]", async () => {
     await adoption.adopt(8, { from: accounts[0] });
     expectedAdopter = accounts[0];
   });


   it("can fetch the address of an owner by pet id", async () => {
    const adopter = await adoption.adopters(8);
    assert.equal(adopter, expectedAdopter, "The owner of the adopted pet should be the first account.");
 });

 it("can fetch the collection of all pet owners' addresses", async () => {
    const adopters = await adoption.getAdopters();
    assert.equal(adopters[8], expectedAdopter, "The owner of the adopted pet should be in the collection.");
   });


});