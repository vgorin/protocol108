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

If the protocol is terminated, the last executor receives the reward.
