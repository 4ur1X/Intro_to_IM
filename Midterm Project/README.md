## Midterm Project Journal

#### TunesUI MP3 Player

**Description**

My plan is to create an MP3 player with a really cool UI and visualizer, which will have more features (that I feel would be helpful for users). There'll be preloaded songs from which the user can select or switch from. Default buttons like play, pause, next, fast-forward etc. will all be implemented. The canvas dimensions are similar to a mobile screen. The program will use all the functionalities learnt in the class until now and some extra ones. More details coming soon . . .

## June 8

- My first step is to draw / plan and figure out the intitial layout of the screen and the colors that will be used along with designing the logo.
- I will try to start coding for either the visualizer part or song progress bar today as I feel these are going to be a bit challenging compared to other features.
- Here is the initial screen (with hover effect) after running the program. Click functionality not added yet.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/initialscreen.gif" height="280">

## June 9

- I will continue to work on the song progress bar and add click functionality for the two options i.e. Play and Explore to direct the users to respective screens.
- PLAY screen will be completed by today.
- I will add a back button as well to go back to the main initial screen, and when the user clicks back button, the song stops playing. 
- I'll explore and gather specific images and songs to be used in the program.

So, here is the result of today's programming. I could implement everything as written above.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/PLAY.gif" height="280">

The appearance of the canvas is such that the title of the song being played will be displayed at the bottom with the artist's name, along with a rotating circle around the artist's image (````translate()```` and ````rotate()````). The song can be made to play from specific parts by just clicking on the song progress bar (as demonstrated in the GIF above). Initially I thought it would be a little difficult to implement it, but it turned out to be a 7 line code in the end :)

````
  // SONG PROGRESS BAR ---------------------------------------------------
  strokeWeight(10);
  stroke(204);
  line(45, 450, width - 45, 450); //where the progress bar should end
  stroke(0);

  TimeStamp = int(map(player.position(), 0, player.length(), 45, width - 45));
  stroke(231, 33, 93);
  line(45, 450, TimeStamp, 450);
  //----------------------------------------------------------------------
````
I have used the ````map()```` function to track the duration of song covered and other line designing functions like ````stroke()```` and ````strokeWeight()````. As the back button (top-left corner) is clicked, the user goes back to the main initial screen and the song stops playing. This happens because I make use of a variable ````start```` which is initially set to 0 and when the user clicks either PLAY or EXPLORE, its values change to 1 or 2 respectively. Through which, I use conditional statements to track which screen the user is on.

## June 10 

- Implement other button functions on PLAY screen i.e. play, pause, next, previous etc. 
- My idea is to add a way for using keys also by:
  - **right and left arrow keys** : for changing songs (similar to next and previous).
  - **up and down arrow keys** : for increasing or decreasing the volume.  
- Work on EXPLORE screen that would consist of a list of preloaded songs from which the user can select and play.

I've added the **Pause** functionality (as shown in the left GIF). 

On the right is the GIF of the finished EXPLORE screen (containing names of the music artists). To choose a particular artist and play their song, the user should click on the green circle (similar to a button) located in the top-right corner in each box. To be honest, this screen was very time-consuming to program due to coordinate positioning.

Today's goals accomplished! I've added the click functionalities for all artists (in EXPLORE screen) to choose and play the respective song (shown in third GIF). The next and previous buttons also added which can be done with right and left keys as well (shown in first-left GIF). While coding, I also came across the idea of using the 'M' key for muting and unmuting the song, which works perfectly fine!

Moreover, the user can use the 'P' key to pause as well (if not using mouse click). The same key can again be pressed to resume the song.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/play_full_implement.gif" height="280"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/explore.gif" height="280">
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/explore_full.gif" height="280">

## June 10

- Change artist and song names (at the bottom) of the PLAY screen and should reflect when song is changed.
- Work on volume increase / decrease functionality using UP and DOWN arrow keys.
- Comment the code and explain.
- Optimize the code and make it more efficient and shorter (in terms of total lines of code).
- Add click sounds.
- I need to add the RESTART functionality too, including the use of 'R' key to do it.

I was just playing around with the code and trying to gather some new ideas. After which, I thought to give my Audio Player an ability to be controlled by using just the keyboard in addition to the mouse.

These functionalities can be performed by using the following keys :

- **UP** and **DOWN** arrows : On the initial screen, to navigate to PLAY screen (press UP) or EXPLORE screen (press DOWN).
- **RIGHT** and **LEFT** arrows : On the PLAY screen, to change to the next (press RIGHT) or previous songs (press LEFT).
- **"R"** key : On the PLAY screen, to **RESTART** the song at any point of time.
- **"P"** key : On the PLAY screen, to **PAUSE** the song at any point of time.
- **"M"** key : On the PLAY screen, to **MUTE** or **UNMUTE** the song at any point of time.
- Numbers **1 - 6** keys : On the EXPLORE screen, to navigate to a particular artist's song without clicking directly.
