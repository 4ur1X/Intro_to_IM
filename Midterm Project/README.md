## Midterm Project Journal

#### TunesUI MP3 Player

**Description**

My plan is to create an MP3 player with a really cool UI and visualizer, which will have more features (that I feel would be helpful for users). There'll be preloaded songs from which the user can select or switch from. Default buttons like play, pause, next, fast-forward etc. will all be implemented. The canvas dimensions are similar to a mobile screen. The program will use all the functionalities learnt in the class until now and some extra ones. More details coming soon . . .

**June 8**

- My first step is to draw / plan and figure out the intitial layout of the screen and the colors that will be used along with designing the logo.
- I will try to start coding for either the visualizer part or song progress bar today as I feel these are going to be a bit challenging compared to other features.
- Here is the initial screen (with hover effect) after running the program. Click functionality not added yet.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/initialscreen.gif" height="280">

**June 9**

- I will continue to work on the song progress bar and add click functionality for the two options i.e. Play and Explore to direct the users to respective screens.
- PLAY screen will be completed by today.
- I will add a back button as well to go back to the main initial screen.
- I'll explore and gather specific images and songs to be used in the program.

So, here is the result of today's programming. I could implement everything as written above.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/Midterm%20Project/PLAY.gif" height="280">

The appearance of the screen is such that the title of the song being played will be displayed at the bottom with the artist's name, along with a rotating circle around the artist's image. The song can be made to play from specific parts by just clicking on the song progress bar (as demonstrated in the GIF above). Initially I thought it would be a little difficult to implement it, but it turned out to be a 7 line code in the end :)

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
I have used the ````map()```` function to track the duration of song covered and other line designing functions like ````stroke()```` and ````strokeWeight()````.
