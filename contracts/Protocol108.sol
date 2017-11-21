pragma solidity 0.4.15;


// D.H.A.R.M.A. Initiative Swan Protocol
// The protocol must be executed at least once every 108 minutes
// Failure to do so releases the reward to the last executor
contract Protocol108 {
	// countdown timer reset value
	uint public length = 6480;

	// last time protocol was executed
	uint offset;

	// last executor of the protocol
	address executor;

	// number of times protocol was executed
	uint cycle;

	// balance available as reward
	uint balance;

	// creates the protocol
	function Protocol108() {
	}

	// initializes the protocol
	function initialize() payable {
		// validate protocol state
		assert(cycle == 0);

		// validate input(s)
		require(msg.value > 0);

		// balance update
		balance += msg.value;

		// init the protocol
		offset = now;

		// set the last executor
		executor = msg.sender;

		// finish initialization
		cycle++;
	}

	// executes the protocol
	function execute() payable {
		// validate protocol state
		assert(cycle > 0);
		assert(offset + length > now);

		// validate input(s)
		require(msg.value > 0);

		// overflow check
		assert(balance + msg.value > balance);

		// balance update
		balance += msg.value;

		// update the protocol
		offset = now;

		// update last executor
		executor = msg.sender;

		// update the cycle
		cycle++;
	}

	// withdraws the reward to the last executor
	function withdraw() {
		// validate protocol state
		assert(cycle > 0);
		assert(offset + length <= now);

		// value to transfer
		uint value = balance;

		// balance update
		balance = 0;

		// transfer the reward to last executor
		executor.transfer(value);
	}

	// number of seconds left until protocol terminates
	function countdown() constant returns (uint) {
		uint n = now;

		// check for negative overflow
		if(offset + length > n) {
			// positive countdown
			return offset + length - n;
		}

		// zero or negative countdown
		return 0;
	}

	// the default payable function, performs one of
	// initialize(), execute() or withdraw() depending on protocol state
	function() payable {
		if(cycle == 0) {
			// protocol not yet initialized, try to initialize
			initialize();
		}
		else if(offset + length > now) {
			// protocol is eligible for execution, execute
			execute();
		}
		else if(balance > 0) {
			// protocol has terminated, withdraw the reward
			withdraw();
		}
		else {
			// invalid protocol state
			revert();
		}
	}

}
