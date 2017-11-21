pragma solidity 0.4.15;


// D.H.A.R.M.A. Initiative Swan Protocol
// The protocol must be executed at least once every 108 minutes
// Failure to do so releases the reward to the last executor
contract Protocol108 {
	// countdown timer reset value
	uint public length;

	// last time protocol was executed
	uint public offset;

	// last executor of the protocol
	address public executor;

	// number of times protocol was executed
	uint public cycle;

	// creates the protocol
	function Protocol108(uint _length) {
		// validate input(s)
		// 108 minutes in production mode
		// 108 seconds in test mode
		require(_length == 108 || _length == 6480);

		// setup the protocol
		length = _length;
	}

	// initializes the protocol
	function initialize() payable {
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
	function execute() payable {
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
	function withdraw() {
		// validate protocol state
		assert(cycle > 0);
		assert(offset + length <= now);

		// transfer the reward to last executor
		executor.transfer(this.balance);
	}

	// number of seconds left until protocol terminates
	function countdown() constant returns (uint) {
		uint n = now;
		if(offset + length > n) {
			return offset + length - n;
		}
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
		else {
			// protocol has terminated, withdraw the reward
			withdraw();
		}
	}

}
