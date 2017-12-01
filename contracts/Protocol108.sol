pragma solidity 0.4.18;


// D.H.A.R.M.A. Initiative Swan Protocol
// The protocol must be executed at least once every 108 minutes
// Failure to do so releases the reward to the last executor
contract Protocol108 {
	// countdown timer reset value
	uint length = 6480;

	// last time protocol was executed
	uint offset;

	// last executor of the protocol
	address executor;

	// number of times protocol was executed
	uint cycle;

	// creates the protocol
	function Protocol108() public {
	}

	// initializes the protocol
	function initialize() public payable {
		// validate protocol state
		assert(cycle == 0);

		// validate input(s)
		require(msg.value > 0);

		// init the protocol
		offset = now;

		// set the last executor
		executor = msg.sender;

		// finish initialization
		cycle++;
	}

	// executes the protocol
	function execute() public payable {
		// validate protocol state
		assert(cycle > 0);
		assert(offset + length > now);

		// validate input(s)
		require(msg.value > 0);

		// update the protocol
		offset = now;

		// update last executor
		executor = msg.sender;

		// update the cycle
		cycle++;
	}

	// withdraws the reward to the last executor
	function withdraw() public {
		// validate protocol state
		assert(cycle > 0);
		assert(offset + length <= now);

		// validate input(s)
		require(msg.sender == executor);

		// reset cycle count
		cycle = 0;

		// transfer the reward
		executor.transfer(this.balance);
	}

	// number of seconds left until protocol terminates
	function countdown() public constant returns (uint) {
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
	function() public payable {
		if(cycle == 0) {
			// protocol not yet initialized, try to initialize
			initialize();
		}
		else if(offset + length > now) {
			// protocol is eligible for execution, execute
			execute();
		}
		else if(this.balance > 0) {
			// protocol has terminated, withdraw the reward
			withdraw();
		}
		else {
			// invalid protocol state
			revert();
		}
	}

}
