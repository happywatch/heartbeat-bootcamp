heartbeat-bootcamp
===============

Special heartbeat version for the Swift Bootcamp. This includes a long press popover and NSUserDefaults storage

### Where to go from here:

1.) on the popover, instead of Total Beats, display Average BPM
 
_HINT_: change the storage so that it is an Array. Then add to the array the bpm for each beat — rather than incrementing totalBeats

2.) add an erratic heartbeat

_HINT_: make bpm an Optional Int. If it is nil, make the duration random for each beat

3.) add a timer that changes to a random beat pattern instead of having to tap

_HINTS_:
* use NSTimer.scheduledTimerWithTimeInterval(target:selector:userInfo:repeats:)
* use arc4random_uniform(maxvalue) to get a random number

For even more features, see the [full version of Heartbeat on GitHub](https://github.com/happywatch/heartbeat).
