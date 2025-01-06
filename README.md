# Hotel Room Rental Smart Contract  

This repository contains a **Hotel Room Rental Smart Contract**, built with Solidity, to securely manage room bookings and payments on the Ethereum blockchain.  

## Features  

1. **Owner Payment System:**  
   - The contract owner automatically receives payments when a room is booked.  

2. **Room Status Management:**  
   - Rooms have two possible states: `vacant` or `occupied`.  
   - The room is initialized as `vacant` upon deployment.  

3. **Secure Booking Functionality:**  
   - Users can occupy a room by paying 1 ether.  
   - Payment is transferred directly to the owner, and the room's status changes to `occupied`.  

4. **Event Emission for Transactions:**  
   - An `Occupy` event is emitted for every successful booking, logging the occupant's address and payment details.  

## Contract Overview  

### Core Components  

- **Owner Management:**  
   - The contract is deployed by the owner who receives payments for bookings.  

- **Room Status:**  
   - The room's status is managed using an `enum` with states `vacant` and `occupied`.  

### Functions  

1. **Constructor:**  
   - Sets the contract deployer as the owner.  
   - Initializes the room's status to `vacant`.  

2. **Modifiers:**  
   - **`onlyVacant`:** Ensures that the room is not already occupied before booking.  
   - **`costs`:** Verifies that the booking amount (1 ether) is paid.  

3. **book():**  
   - Allows users to book the room by sending 1 ether.  
   - Transfers the payment directly to the owner.  
   - Changes the room's status to `occupied` upon successful payment.  
   - Emits an `Occupy` event with booking details.  

### Events  

- **`Occupy(address _occupant, uint value)`:**  
   - Triggered after a successful booking, logging the occupant's address and payment amount.  

## How It Works  

1. The contract is deployed by the owner, and the room is initialized as `vacant`.  
2. Users can call the `book()` function to occupy the room, provided it is vacant and they pay 1 ether.  
3. Once the payment is processed, the room's status is updated to `occupied`, and the owner receives the funds.  
4. The transaction details are recorded through the `Occupy` event for transparency.  

## Security  

- Booking is allowed only if the room is vacant, ensuring no double bookings.  
- Payments are verified to match the required amount (1 ether).  
- Funds are transferred securely to the owner's wallet using the `call` method.  

## Getting Started  

### Requirements  

- Solidity compiler version 0.8.14 or higher.  
- Ethereum wallet with test ether for deploying and interacting with the contract.  

### Deployment Steps  

1. Deploy the contract to an Ethereum-compatible blockchain or test network.  
2. Interact with the contract:  
   - **Book a Room:** Call the `book()` function with exactly 1 ether to secure the room.  
   - **Event Tracking:** Use transaction logs to view emitted `Occupy` events.  

---

This smart contract demonstrates the potential for blockchain in streamlining secure and transparent room rental processes. It serves as an excellent starting point for learning about decentralized applications in the hospitality sector.
