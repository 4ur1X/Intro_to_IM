## Midterm Project Journal

#### TunesUI MP3 Player

**Description**

My plan is to create an MP3 player with a really cool UI and visualizer, which will have more features (that I feel would be helpful for users). There'll be preloaded songs from which the user can select or switch from. Default buttons like play, pause, next, fast-forward etc. will all be implemented. The canvas dimensions are similar to a mobile screen. The program will use all the functionalities learnt in the class until now and some extra ones. The audio player can be controlled by keyboard as well.

## June 8

- My first step is to draw / plan and figure out the intitial layout of the screen and the colors that will be used along with designing the logo.
- I will try to start coding for either the visualizer part or song progress bar today as I feel these are going to be a bit challenging compared to other features.
- Here is the initial screen (with hover effect) after running the program. Click functionality not added yet.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/initialscreen.gif" height="280">

## June 9

- I will continue to work on the song progress bar and add click functionality for the two options i.e. Play and Explore to direct the users to respective screens.
- PLAY screen will be completed by today.
- I will add a back button as well to go back to the main initial screen, and when the user clicks back button, the song stops playing. 
- I'll explore and gather specific images and songs to be used in the program.

Status: All goals accomplished.

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

Today's goals accomplished! I've added the click functionalities for all artists (in EXPLORE screen) to choose and play the respective song (shown in third GIF). The next and previous buttons also added which can be done with right and left keys as well (shown in first-left GIF). I have implemented two arrays ````which_song[]```` and ````which_artist[]```` to load and store different songs with their respective artists' image or logo.

While coding, I also came across the idea of using the 'M' key for muting and unmuting the song, which works perfectly fine!

Moreover, the user can use the 'P' key to pause as well (if not using mouse click). The same key can again be pressed to resume the song.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/play_full_implement.gif" height="280"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/explore.gif" height="280">
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/explore_full.gif" height="280">

## June 11

- Change artist and song names (at the bottom) of the PLAY screen and should reflect when song is changed.
- Work on volume increase / decrease functionality using UP and DOWN arrow keys.
- Comment the code and explain.
- Optimize the code and make it more efficient and shorter (in terms of total lines of code).
- Add click sounds.
- I need to add the RESTART functionality too, including the use of 'R' key to do it.

I was just playing around with the code and trying to gather some new ideas. After which, I thought to give my Audio Player an ability to be controlled or navigated by just using the keyboard in addition to the mouse.

Almost all the functionalities can be performed by using the following keys :

- **UP** and **DOWN** arrows : On the initial screen, to navigate to PLAY screen (press UP) or EXPLORE screen (press DOWN).
- **UP** and **DOWN** arrows : On the PLAY screen, to increase or decrease the volume of the song.
- **RIGHT** and **LEFT** arrows : On the PLAY screen, to change to the next (press RIGHT) or previous songs (press LEFT).
- **"R"** key : On the PLAY screen, to **RESTART** the song at any point of time.
- **"P"** key : On the PLAY screen, to **PAUSE** the song at any point of time.
- **"M"** key : On the PLAY screen, to **MUTE** or **UNMUTE** the song at any point of time.
- **"B"** key : To return back to the previous / initial screen.
- Numbers **1 - 6** keys : On the EXPLORE screen, to navigate to a particular artist's song without clicking directly.
- **ENTER** key : On the initial screen, to directly go to the PLAY screen.
- **SPACE** key : On the any screen, to go to the **INSTRUCTIONS** screen.

Right now, all of these work fine without any issues.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/restart.gif" height="280">
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/next_previous.gif" height="280">

I've added the **restart button** at the top-right corner. When clicked, the song returns to the beginning (see the progress bar) (left GIF). The right GIF shows the completed PLAY screen reflecting the name changes when a song is changed (right GIF). The volume can be controlled by using **UP** and **DOWN** keys, when on PLAY screen.

## June 12

- I have to now work on the **INSTRUCTIONS** page. On the initial screen, there'll be an icon in the bottom-rigth corner which the user can click and it will take him to that screen.

**UPDATE:** I have completed the task outlined above. Below is the GIF.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/instructions.gif" height="280">
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/GIF%20Demos/instructions.jpg" height="280">

**NOTE:** It can also be done using the keyboard by pressing either **'SPACE'** or **'I'** key.

The instructions screen wasn't made using the ````text()```` function of Processing. Instead, I used a designing tool and typed all the text in that and took screenshot. I thought to approach this way because this wasn't a big deal to the program (just displaying text) and to avoid the hassle of coordinate positioning for each single line of text. 

## June 13

- Do a final review of everything (code + output + journal).
- Add click / button sounds.
- Upload a video demonstration on YouTube. [Click here](https://www.youtube.com/watch?v=jPg9lxFw0Ys) to watch.

**Status:** All task done! I found a click sound online that I added to all mouse clicks.

## June 14

**Final Reflection / Thoughts**

The coding process was really smooth for me. I didn't encounter any difficulties apart from often getting stuck on coding the song progress bar. Although it seems simple looking at the code, but the thought process was a bit difficult for me. So, I just explored around on the internet and got a clear understanding of how to code it. Otherwise, everything was simple especially because I had some experience in making games in Processing in my Intro to CS class. While I had faced many difficulties that time, but this time around I knew the mistakes I had to avoid and knew some workarounds or tricks. The journalling process made it a lot smoother because I was clear on my daily goals. I didn't try going beyond the everyday tasks even if I had time. I knew I'd be able to complete by the deadline.

**NOTE:** I've used the MINIM library for audio instead of using the one by Processing.

**Class used:**
- ````TunesUI````

**Functions used:**
- ````load_images()```` : To load all the artists images to be displayed on the PLAY screen.
- ````initial_screen()```` : Contains the graphical part of the initial screen.
- ````play_screen()```` : The actual screen where the song starts playing.
- ````title_at_the_bottom()```` : To change the artist and song title when song is changed.
- ````next_previous()```` : The next and previous buttons to change songs.
- ````explore()```` : The screen where the user gets to explore and choose the song.
