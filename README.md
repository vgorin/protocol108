# Protocol 108 (a.k.a. Swan Protocol)

## Abstract
[Swan protocol](http://lostpedia.wikia.com/wiki/Swan_protocol), as introduced in the [LOST (TV Series)](https://en.wikipedia.org/wiki/Lost_(TV_series)), is to type a [sequence](http://lostpedia.wikia.com/wiki/The_numbers) into a [computer](http://lostpedia.wikia.com/wiki/Swan_computer) every [108](http://lostpedia.wikia.com/wiki/108) minutes in order to avert the worldwide catastrophe.
Typing [the numbers](http://lostpedia.wikia.com/wiki/The_numbers) and pressing "execute" (a.k.a. **pushing the button**) on the keyboard discharges an electromagnetic buildup, continually averting worldwide catastrophe.

The motivation of the [survivors](http://lostpedia.wikia.com/wiki/Survivors) to execute the protocol is to stay alive. On the other hand, since no one really knows what happens if the [countdown timer](http://lostpedia.wikia.com/wiki/Countdown_timer) reaches zero, there is a source of demotivation to execute the protocol – lack of trust to the [film](http://lostpedia.wikia.com/wiki/Swan_Orientation_film), describing the protocol.

The protocol can be considered as a psychological test, aimed at making participants to perform a meaningless action every 108 minutes. 

We propose a blockchain-based implementation of the **Protocol 108**, based on the economical motivation and demotivation.

## The Concept
The idea behind the protocol is to make participants execute the protocol at least once every 108 minutes.

### The Simplest Implementation Consideration
The *creator* deploys a **Protocol 108** smart contract into the network and initializes it with the initial value – *the reward*. After the initialization the *countdown* starts from 108 minutes and the creator becomes the *last executor*.

The protocol *terminates* if the countdown reaches zero, meaning the protocol is not executed within 108 minutes timeframe.

During the countdown anyone can send some value to the protocol in order to execute it, adding this value to the reward, reseting the countdown back to 108 minutes and becoming the last executor.

The last executor receives the reward as soon as protocol terminates.

## Implementation
### Version 1: MVP
Protocol lifecycle consists of three states: inactive, active, terminated.

#### Inactive
This is the initial state of the protocol, the protocol is deployed in this state. Protocol balance is zero and countdown timer is stopped.

#### Active
Inactive protocol may be executed at any moment by sending a value to it. Once the protocol is executed it becomes active.

#### Terminated
Active protocol terminates once it is not executed for 108 minutes. Terminated protocol cannot be executed.

Last executor can send any value to it to withdraw the reward. Once this happens, protocol state changes back to inactive.

### Known Issues
Issues to address in future releases:
1. There is no motivation to initiate the protocol, moving its state from inactive into active.
2. [The numbers (4 8 15 16 23 42)](http://lostpedia.wikia.com/wiki/The_numbers) are not used in the protocol.

## Try It Out!
+ **Ropsten**:
  + v1: [``0x018b4f94672f015aaA9454B398cb9A50981D88c7``](https://ropsten.etherscan.io/address/0x018b4f94672f015aaA9454B398cb9A50981D88c7)
  + v2: [``0x9d1F64Df3019eea83D35C350a0FDA1f9563B7cFA``](https://ropsten.etherscan.io/address/0x9d1F64Df3019eea83D35C350a0FDA1f9563B7cFA)
+ **Rinkeby**:
  + v1: [``0x35df88a99dd25da942d8d99d9344495b6857eec0``](https://rinkeby.etherscan.io/address/0x35Df88a99dd25Da942D8d99D9344495b6857EEC0)
  + v2: [``0xba7a129933519ab9aae0f97d5456b76e26fbf7f3``](https://rinkeby.etherscan.io/address/0xBa7A129933519ab9aAe0f97d5456B76E26fbf7f3)

## See Also
+ [Mythology of Lost](https://en.wikipedia.org/wiki/Mythology_of_Lost)
+ [The Lost Encyclopedia](http://lostpedia.wikia.com/wiki/Main_Page)
+ [The Button Experiment on Reddit](https://www.reddit.com/r/thebutton/)
