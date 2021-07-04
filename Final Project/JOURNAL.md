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
    (etc . . .)


The following components for Arduino will be used:

- **Potentiometer** : will use it like a steering wheel.
- **LCD Screen** : to digitally display the car speed dynamically (like a speedometer) and total lap time.
- **Button 1** : to accelerate the car forward.
- **Button 2** : to apply brake.
- **Button 3** : Nitro / Boost.
- **Button 4** : Horn.
- **Buzzer Tone** : to output horn (beep) sound.

I think I'll need to use all of the Processing items / functions for my game.

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

**EXTRA INFO** : The customize screen has several car modification options as you can see in the GIF. As of now, only the car model as well as color can be changed. 

I could finish customize screen today and accomplish most of the part for actual gameplay (still incomplete). I couldn't work on designing the race tracks, so I'll continue with it the next day.


## July 2

**TODAY'S TASKS**

- Work on code for the main gameplay.
- Design three race tracks.
- Try to integrate one button and a potentiometer to move the car forward and steer, respectively.

**OUTCOME** : Majority of my day was spent on integrating the 3 buttons (for forward acceleration, nitro boost, and horn) as for some unknown reason, the three weren't working the way they should. At times, the when I pressed one button, the other button's functionality would also get affected. So, I had to redo and rewrite the circuit and code respectively many number of times. It should've been simple for me, but sometimes even the simple things seem hard on some days :) so I was lost.

However, now it works perfectly fine as I want it to. Moreover, eventhough it wasn't mentioned in today's task, I added the buzzer (for horn) and potentiometer (for steering)  functionalities as well. Now, the only component that needs to be added is the LCD screen.

Since the race track designing is least of my priority so I thought to push it to another day.

## July 3

**TODAY'S TASKS**

- 
