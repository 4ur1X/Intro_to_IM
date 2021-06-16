## Arduino Homework 1 - June 10

### Using analog sensor and digital sensor to control two LEDs, one in a digital fashion and the other in an analog fashion, in some creative way.

Below is the GIF of the resultant Arduino program :

**Description**

I tried to implement three different patterns of blinking using 3 LEDs and 3 switches along with conditions. 
- When **switch 1** is pressed, the LEDs blink one by one in a quick manner. I used ````delay()```` function with different parameters.
- When **switch 2** is pressed, each LED blinks twice and then goes to the next LED. Again, ````delay()```` is used.
- When **switch 3** is pressed, the LEDs remain lighted for more duration (single blink) and lights the next LED simultaneously while the previous is also glowing. Then, it proceeds in a reverse manner (as shown in GIF).

Below is the **schematic** of the circuit :
