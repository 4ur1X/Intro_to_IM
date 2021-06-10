## Arduino Homework 1 - June 10

###  Creating different blinking patterns of LED lights using Arduino and switches.

#### LED Blinks (x3)

Below is the GIF of the resultant Arduino program :

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%2010/Demo/ledlights.gif" height="200">

**Description**

I tried to implement three different patterns of blinking using conditions. 
- When switch 1 is pressed, the LEDs blink one by one in a quick manner. I used ````delay()```` function with different parameters.
- When switch 2 is pressed, each LED blinks twice and then goes to the next LED. Again, ````delay()```` is used.
- When switch 3 is pressed, the LEDs remain lighted for more duration (single blink) and lights the next LED while the previous is also glowing. Then, it proceeds in a reverse manner (as shown in GIF).
