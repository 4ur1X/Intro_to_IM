## Homework 3 - May 31

###  Creating a game with the help of functions in Processing.

#### ASTEROID ESCAPE (inpired by space shooter games)

Below is the GIF of the resultant game :

<img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/May%2031/asteroidescape.gif" height="500">

**Objective of the game:** To prevent the Spaceship from colliding with the asteroids.

**Gameplay instruction:** Use the mouse cursor to move the Spaceship around.

**Functions used:**
- ````stars(int i)````: To achieve the movement of stars.
- ````asteroid(int i)````: To achieve the movement of asteroids.
- ````placement_stars_asteroids()````: To randomly place (initial positions) both the stars and the asteroids on the game screen.
- ````extra_features()````: To add extra functionalities to the game i.e. background music, load images and background.
- ````display_text()````: To display the game's title on screen.

**NOTE:** I tried to improvise on my previous homework's (26th May) program "Starfield" by modifying and adding a few other things. The whole program is now based on functions. Moreover, I changed the canvas layout and added mouseX and mouseY functionalities for the Spaceship to move along the cursor. I haven't added the collision detection with asteroids functionality yet as it requires a more sophisticated code.
