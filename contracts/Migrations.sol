pragma solidity 0.4.18;


// dummy migrations contract
contract Migrations {
	// log this event
	event Completed(uint completed);

	function Migrations() public {}

	// A function with the signature `setCompleted(uint)` is required.
	function setCompleted(uint completed) public {
		// log function call
		Completed(completed);
	}
}
