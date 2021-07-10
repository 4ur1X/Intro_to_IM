## Final Project Journal

#### NASCAR Circuit Training Game - Make and Break your Own Record!

**Description**

My main idea is to implement a **training scenario** that F1 racers go through before actually racing on the final track with other racers. 

The objective of the player is to complete maximum number of laps in a limited time by testing various parameters (by changing steering sensitivity, speed, etc.) to get the best possible time record of the fastest lap. The high score will be stored / saved in a file, so that it gets updated as soon as the record is broken.

- several race track venues to choose from.
- drive through difficult corners.
- modify your car
  - change the steering sensitivity
  - increase the acceleration
  - change the car’s maximum speed
  - modify the car’s look and sound

The following components for Arduino will be used:

- **Potentiometer** : will use it like a steering wheel.
- **LCD Screen** : to digitally display the car speed dynamically (like a speedometer) and total lap time.
- **Button 1** : to accelerate the car forward.
- **Button 2** : Nitro / Boost.
- **Button 3** : Horn.
- **Buzzer Tone** : to output horn (beep) sound.

The following components for Processing will be used:

- Images and sprites
- Sound
- Text
- Transformations
- Animation

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/race.jpg" height="230"> &emsp;&emsp; 

## June 30

**TODAY'S TASKS**

My today's task included designing different screens for the game i.e. initial screen, story screen, choose mode screen, and choose track screen.
I also added background music and mouse click functionality to navigate to all of those screens. 

To navigate to the initial screen directly, one can press the 'X' key. Below is the GIF of today's completed task.

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/nascar_day1.gif" height="230"> &emsp;&emsp; 

## July 1

**TODAY'S TASKS**

- I'll work on "customize" screen and add all the modification properties for the car.
- I'll also work on the most important component of the game i.e. actual gameplay screen.
- I might design different race tracks as well.

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/nascar_day2.gif" height="230"> &emsp;&emsp;

**EXTRA INFO** : The customize screen has several car modification options as you can see in the GIF. As of now, only the car model as well as color can be changed. I've used the ````switch```` statement for accomplishing this purpose.

I could finish customize screen today and accomplish most of the part for actual gameplay (still incomplete). I couldn't work on designing the race tracks, so I'll continue with it the next day.


## July 2

**TODAY'S TASKS**

- Work on code for the main gameplay.
- Design three race tracks.
- Try to integrate one button and a potentiometer to move the car forward and steer, respectively.

**OUTCOME** : Majority of my day was spent on integrating the 3 buttons (for forward acceleration, nitro boost, and horn) as for some unknown reason, the three weren't working the way they were supposed to. At times, when I pressed one button, the other button's functionality would also get affected. So, I had to redo and rewrite the circuit and code respectively many number of times. It should've been simple for me, but sometimes even the simple things seem hard on some days :) so I was lost.

However, now it works perfectly fine as I want it to. Moreover, eventhough it wasn't mentioned in today's task, I added the buzzer (for horn) functionality as well. Now, the only components that needs to be added are the LCD screen and Potentiometer.

Since the race track designing is least of my priority so I thought to push it to another day.

## July 3

**TODAY'S TASKS**

- Work on Instructions screen.

Today I designed and completed the Instructions screen for the game. I chose not to focus much on the technical part for today.

Below you can see the intructions screen:

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/nascar_day4.gif" height="230"> &emsp;&emsp;

## July 4

**TODAY'S TASKS**

- Driving and rotating the car using keyboard keys and mouse first (to test).
- Integrate the potentiometer for steering the car.

I decided to spend my whole day focusing on just one part of the gameplay i.e. steering the car using potentiometer, as this is the most crucial part of the game. I still need to work on it as the car just rotates with potentiometer, but doesn't drive in that particular direction.

Here is the result:

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/nascar_day5.gif" height="230"> &emsp;&emsp;

## July 5

**TODAY'S TASKS**

- Design the main gameplay side screen to show / include score, lap time, speed, direction, track map, etc.
- Try to synchronize various car properties / customizations (made by the player in customize screen) into the car.
- Add an RGB LED light to light up **green** when the car is accelerating forward, **red** when car stops, **blink purple** when the car applies nitro.

**TODAY'S OUTCOME**

I could complete the whole circuit for Arduino (3 Buttons, Potentiometer, LCD Screen, Buzzer, RGB LED Light). I'm also able to control the main game using these components now. An issue I faced here was that I am using potentiometer to steer the car, so I wondered how could I control the LCD screen brightness / contrast without it. However, luckily I found an easy way online by using an extra variable ````int Contrast = 118;```` and using it in ````analogWrite(3, Contrast);````, where 3 is the pin number. So, it was kind of an indirect way. To change the brightness of the screen, I can just change the ````Contrast```` value in the actual code manually. 

Below is the completed circuit (left) and main gameplay screen (right):

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/nascar_day6_circuit.jpg" height="250"> &emsp;&emsp;
<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Final%20Project/GIF%20Demos/nascar_day6.gif" height="250"> &emsp;&emsp;

## July 6

**TODAY'S TASKS**

- Add customizations done by the player to affect the actual gameplay.
- Detection of Start and Finish points on track. 
- Add three different race tracks.
- Work on two separate modes.

"Add customizations done by the player to affect the actual gameplay" was accomplished by just maintaining extra variables for each car and updating the new values according to the player's selection. Initially, I planned to design the race tracks on my own, but due to time constraints I downloaded them from the internet. I could also implement the two modes completely. I really struggled with the detection of start and finish part of the game. So, I rewatched Daniel Shiffman's PVector videos and some other YouTube tutorials on this topic. I could implement it successfully after hours of trying and failing repeatedly. For this, I used two separate functions i.e. ````updateCheckpoint()```` and ````updateStart()```` to update the game state to either stop (false) or continue (true) when the car has entered that particular box / area. The main function that actually checked for whether the car has crossed the start line is:

````
boolean isInsideRect(PVector p, PVector rp, PVector rs) {
  if (p.x > rp.x - rs.x/2 && p.x < rp.x + rs.x/2 && 
    p.y > rp.y - rs.y/2 && p.y < rp.y + rs.y/2) {
    return true;
  }
  return false;
}
````

## July 7

**TODAY'S TASKS**

I'm almost done with most part of the game by now. Only a few things that are left to be implemented are the following: 
- Game Over screen for two different modes
- Timer / Clock
- Add Reset and Restart functionality

I thought to start my day by implementing a stopwatch (starts automatically when the race starts) to get an easy start. The code is as below:

````
if (raceStarted == true) {
    raceTime += 1 / frameRate; // seconds timer
````
Then, I went over to designing the Game Over screens in Canva. In mode 1, the screen displays the total number of laps covered in a particular time. While in mode 2, the screen displays the total time it took to complete one lap. Other than that, implementing reset and restart wasn't hard and didn't take much of my time as it was something I had done many number of times previously.

## July 8

**TODAY'S TASKS**

- Create a demo video
- Clean up the code and optimize
- Add comments to the final code (in both Processing and Arduino)

Today is the last day and I've been managing my time since the start of the project so I don't have much left to do now except the ones I listed above, which will only take me an hour or so to complete.

## Struggles and Workarounds

I struggled with implementing the detection of start and finish of one lap as the coordinates kept on changing when the car moved. This was because I wasn't actually moving the car, but the background in the opposite direction of the car instead (to give it an illusion of car's movement). So, in order to achieve the detection correctly, I added two components ````checkpointPos.add(vel);```` and ````startPos.add(vel);````to the ````moveBackround()```` function.

````
void movetrack(PVector vel) {
  vel.x = -vel.x;
  vel.y = -vel.y;
  startPos.add(vel);
  checkpointPos.add(vel);
  trackPos.add(vel);
}
````

Moreover, I had to actually figure out a way to use LCD Screen without Potentiometer (solution mentioned above under July 5) and I luckliy found a way online!

## Takeaways and Conclusion

This project was one of my dream projects since childhood. I am an avid car enthusiast and I've always wanted to make a car game like this. Integrating it with Arduino components (instead of the usual keyboard controls) made it even more fun to make and play. The journalling process was really helpful as well as I knew exactly what to work on a particular day. I didn't try to go beyond the tasks assigned for a particular day even though I completed it and had some time left. It made me stay organized.
