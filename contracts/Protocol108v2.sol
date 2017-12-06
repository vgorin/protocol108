pragma solidity ^0.4.0;

import './Protocol108.sol';

// D.H.A.R.M.A. Initiative Swan Protocol version 2
// makes use of the sequence, 4 8 15 16 23 42
contract Protocol108v2 is Protocol108 {
	// smart contract version
	uint public version = 2;

	// creates the protocol, nothing to improve here
	function Protocol108v2() Protocol108() public {
	}

	// validates the input sequence of numbers
	// improvement over version 1 protocol, makes use of the sequence
	function validate(uint sequence) public constant returns (bool) {
		// save the countdown value for reuse inside the function
		uint c = countdown();

		// validate the sequence:
		// require ~0.0048 ETH to initialize the protocol,
		// or to execute it if countdown is four minutes or more
		// require ~4.8 szabo to execute the protocol if
		// countdown is one minute or more
		// require ~4.8 Gwei to execute the protocol if
		// countdown is less then one minute
		require(
			c < 60 && ( // ~4.8+ Shannon
				sequence == 4815162342
				|| sequence == 48151623420
				|| sequence == 481516234200
			) || //
			c < 240 && ( // ~4.8 Szabo
				sequence == 4815162342000
				|| sequence == 48151623420000
				|| sequence == 481516234200000
			) || (
				sequence == 4815162342000000 // ~0.0048 ETH
				|| sequence == 48151623420000000 // ~0.048 ETH
				|| sequence == 481516234200000000 // ~0.48 ETH
				|| sequence == 4815162342000000000 // ~4.8 ETH
				|| sequence == 48151623420000000000 // ~48 ETH
				|| sequence == 481516234200000000000 // ~0.48 Einstein
				// to reduce gas costs we use seqSearch only for big numbers
				|| seqSearch(sequence, 12, 56) != -1 // ~4.8 Einstein - ~4.8*10^55 Einstein
			)
		);

		// we won't get here if validation fails
		return true;
	}

	// checks if sequence can be represented in form of
	// 48151623420..00 where number of trailing zeroes
	// is between offset and offset + length;
	// returns number of trailing zeroes or -1
	// if the sequence cannot be represented in this form
	function seqSearch(uint sequence, uint offset, uint length) private constant returns (int) {
		for(uint i = offset; i < offset + length; i++) {
			if(sequence == 4815162342 * 10 ** i) {
				// found at index i
				return int(i);
			}
		}

		// not found
		return -1;
	}
}
