## Arduino Homework 4 - June 28

### Making a game using serial communication between Arduino and Processing.

#### RGB Hit/Miss Game

Below is the photo of the circuit and GIF of the game :

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%2028/rgbball.jpg" height="230"> &emsp;&emsp; 
<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%2028/rgbball.gif" height="230">

[Click Here](https://youtu.be/1YZiuB7duIw) for DEMO

**Description**

- The game's objective is to **get more hits** (by placing the platform such that the ball bounces on it) than **misses** in a maximum time of **30 seconds**. 
- The horizontal platform reduces its size by some value on each hit.
- The ball bounces itself, but the player can move the platform left or right using the two buttons on the breadboard.
- There is a timer on top-right corner that updates (decrements) itself every 1 second.
- The live score can be seen in the top-left corner.
- To **RESTART** the game (either in between or after game over), you can click anywhere on the canvas with the mouse, or press **'SPACE'** key. 

Below is the **schematic** of the circuit :

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%2028/rgbball_schematic.jpg" height="250">


