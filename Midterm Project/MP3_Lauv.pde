/*---------------------------------------------------------------------------------------------------------------- //<>//
 
 Interactive Media MidTerm Project
 
 T U N E S U I        M P 3       A U D I O P L A Y E R
 - by Ronit Singh
 
 -----------------------------------------------------------------------------------------------------------------*/

// importing MINIM sound package to use sound functions
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer clicks;
AudioMetaData meta;

AudioPlayer[] playlist; // array to store songs

PImage round; // rotating disc on PLAY screen
PImage bg;
PImage instructions_bg;
PImage music_logo;
PImage reset_button;
PImage[] artists;
PImage tunes_logo;
PImage back_button;
PImage instructions_logo;

int TimeStamp = 45;

int which_song=2;
int which_artist=2;

boolean rotate=true;

float angle=0;
float volume =0;
int start=0;
int option = 0;
boolean back_press = false;
boolean pause = false;
int click_number=0;

class TunesUI {
  void load_images() {
    tunes_logo = loadImage("tunes.png");
    bg = loadImage("bg2.jpg");
    reset_button = loadImage("reset_button.png");
    music_logo = loadImage("music-logo.png");
    round = loadImage("round.png");
    back_button = loadImage("back.png");
    instructions_logo = loadImage("instructions.png");
    instructions_bg = loadImage("instructions_bg.png");

    // loading each artist
    artists = new PImage[6];
    for (int i=0; i<6; i++) {
      artists[i] = loadImage("artist" + i + ".png");
    }
  }

  void initial_screen() {

    image(tunes_logo, 75, 60, 300, 300);
    image(music_logo, 145, 360, 150, 150);
    image(instructions_logo, width-50, height-50, 40, 40);
    //rect(403,750,45,45);

    fill(255);
    textSize(28);
    text("MP3 Audio Player", 110, 320);

    strokeWeight(1);
    noFill();
    stroke(255);

    fill(231, 33, 93);
    textSize(28);
    text("P L A Y", 175, 610);

    noFill();
    rect(85, 570, 270, 60, 100);

    // Hover Effect
    if (mouseX>85 && mouseX<355 && mouseY > 570 && mouseY < 630) {
      fill(68, 185, 227);
      rect(85, 570, 270, 60, 100);
      fill(255);
      textSize(28);
      text("P L A Y", 175, 610);
    }

    fill(68, 185, 227);
    textSize(28);
    text("E X P L O R E", 135, 710);

    noFill();
    rect(85, 670, 270, 60, 100);

    // Hover Effect
    if (mouseX>85 && mouseX<355 && mouseY>670 && mouseY<730) {
      fill(231, 33, 93);
      rect(85, 670, 270, 60, 100);
      fill(225);
      textSize(28);
      text("E X P L O R E", 135, 710);
    }

    fill(225);
    textSize(18);
    text("Made by Ronit", 160, 780);
  }

  void play_screen() {

    image(back_button, 10, 10, 40, 40);
    image(reset_button, 400, 10, 40, 40);
    fill(0);

    pushMatrix();
    translate(width/2, height/2-160);
    ellipse(0, 0, 20, 20);

    // if song is paused, then stop rotating
    if (rotate) {
      rotate(angle);
    } else {
      rotate(0);
    }

    image(round, -160, -160, 320, 320);
    angle+=0.015;
    popMatrix();

    // image of the artist in the center of the rotating disc and screen
    image(artists[which_artist], 115, 130.5, 220, 220);

    // PAUSE / PLAY button
    noFill();
    stroke(255);
    strokeWeight(4);
    ellipse(width/2, height/2+120, 70, 70);
    strokeWeight(2);
    fill(231, 33, 93);
    ellipse(width/2, height/2+120, 55, 55);
    fill(255);
    strokeWeight(6);

    // to pause or play and show the respective shape (triangle or lines)
    // click_number%2!=0 - ODD, then PAUSE
    // click_number%2==0 - EVEN, then PLAY
    if (pause == true && click_number%2!=0) {
      pushMatrix();
      translate(205, 490);
      triangle(10, 20, 10, 40, 30, 30);
      popMatrix();
    } else {
      line(width/2-8, height/2+132, width/2-8, height/2+105);
      line(width/2+8, height/2+132, width/2+8, height/2+105);
    }

    fill(231, 33, 93);

    // shows title (artist and song name) at PLAY screen's bottom
    title_at_the_bottom();

    // SONG PROGRESS BAR ---------------------------------------------------
    strokeWeight(10);
    stroke(204);
    line(45, 450, width - 45, 450); //where the progress bar should end
    stroke(0);

    TimeStamp = int(map(playlist[which_song].position(), 0, playlist[which_song].length(), 45, width - 45));
    stroke(231, 33, 93);
    line(45, 450, TimeStamp, 450);
    //----------------------------------------------------------------------

    // drawing the triangles (like <<< or >>>) to switch between songs using mouse click
    next_previous();

    // if the user click the back button
    if (back_press) {
      start=0; // initial screen
      back_press = false; // setting default value again
    }
  }

  void title_at_the_bottom() {

    if (which_song == 0) {
      textSize(55);
      text("C O L D P L A Y", 24, 670);
      strokeWeight(0);
      textSize(25);
      text("S O M E T H I N G", 125, 750);
    } else if (which_song == 1) {
      textSize(100);
      text("L A U V", 50, 685);
      strokeWeight(0);
      textSize(25);
      text("T  H  E    O  T  H  E  R", 95, 750);
    } else if (which_song == 2) {
      textSize(35);
      text("O N E D I R E C T I O N", 36, 670);
      strokeWeight(0);
      textSize(25);
      text("P E R F E C T", 150, 750);
    } else if (which_song == 3) {
      textSize(65);
      text("N E F F E X", 55, 670);
      strokeWeight(0);
      textSize(25);
      text("H O P E", 175, 750);
    } else if (which_song == 4) {
      textSize(100);
      text("Z A Y N", 45, 685);
      strokeWeight(0);
      textSize(25);
      text("V I B E Z", 175, 750);
    } else if (which_song == 5) {
      textSize(65);
      text("E M I N E M", 50, 670);
      strokeWeight(0);
      textSize(25);
      text("N O T  A F R A I D", 115, 750);
    }
  }

  void next_previous() {
    fill(255);
    pushMatrix();
    translate(300, 485);
    triangle(10, 20, 10, 40, 30, 30);
    popMatrix();

    pushMatrix();
    translate(320, 485);
    triangle(10, 20, 10, 40, 30, 30);
    popMatrix();

    pushMatrix();
    translate(145, 485);
    scale(-1, 1);
    triangle(10, 20, 10, 40, 30, 30);
    popMatrix();

    pushMatrix();
    translate(125, 485);
    scale(-1, 1);
    triangle(10, 20, 10, 40, 30, 30);
    popMatrix();
  }

  void explore() {

    image(back_button, 10, 10, 40, 40);
    fill(255);
    textSize(25);
    text("E X P L O R E", 155, 40);

    // song list here
    pushMatrix();
    translate(0, 20);
    noStroke();
    fill(68, 185, 227);
    rect(15, 65, width/2-20, width/2-20, 20);
    fill(231, 33, 93);
    rect(width/2+12, 65, 200, width/2-20, 20);

    fill(231, 33, 93);
    rect(15, 290, width/2-20, width/2-20, 20);
    fill(68, 185, 227);
    rect(width/2+12, 290, 200, width/2-20, 20);

    fill(68, 185, 227);
    rect(15, 515, width/2-20, width/2-20, 20);
    fill(231, 33, 93);
    rect(width/2+12, 515, 200, width/2-20, 20);
    popMatrix();


    // GREEN BUTTONS to choose and play according to the user

    fill(0);
    ellipse(193, 110, 40, 40);
    fill(10, 190, 20);
    ellipse(193, 110, 30, 30);

    fill(0);
    ellipse(409, 110, 40, 40);
    fill(10, 190, 20);
    ellipse(409, 110, 30, 30);

    fill(0);
    ellipse(193, 335, 40, 40);
    fill(10, 190, 20);
    ellipse(193, 335, 30, 30);

    fill(0);
    ellipse(409, 335, 40, 40);
    fill(10, 190, 20);
    ellipse(409, 335, 30, 30);

    fill(0);
    ellipse(193, 560, 40, 40);
    fill(10, 190, 20);
    ellipse(193, 560, 30, 30);

    fill(0);
    ellipse(409, 560, 40, 40);
    fill(10, 190, 20);
    ellipse(409, 560, 30, 30);

    //--------------------------------------------------------

    // displaying artist images and names
    image(artists[1], 267, 105, 135, 135);
    textSize(20);
    fill(255);
    text("L A U V", 301, 272);

    image(artists[0], 45, 105, 135, 135);
    text("C O L D P L A Y", 46, 272);

    image(artists[2], 45, 330, 135, 135);
    text("1 D", 97, 498);

    image(artists[3], 267, 330, 135, 135);
    text("N E F F E X", 287, 498);

    image(artists[4], 45, 555, 135, 135);
    text("Z A Y N", 79, 722);

    image(artists[5], 267, 555, 135, 135);
    text("E M I N E M", 283, 722);
  }

  void instructions_screen() {
    start=3;
    background(instructions_bg);
    image(back_button, 10, 10, 40, 40);
  }
}

TunesUI tunes = new TunesUI();

void setup() {
  size(450, 800);
  tunes.load_images();
  minim = new Minim(this);
  playlist = new AudioPlayer[6];
  for (int i=0; i<6; i++) {
    playlist[i] = minim.loadFile("song" + i + ".mp3");
  }

  clicks = minim.loadFile("click2.wav");
}

void draw() {

  background(bg);

  playlist[which_song].setGain(volume); // control song volume

  // INITIAL SCREEN ----------------------------------------
  if (start == 0) {
    playlist[which_song].pause(); // song shouldn't play when on initial screen
    tunes.initial_screen();
  }
  //--------------------------------------------------------

  // PLAY SCREEN -------------------------------------------
  if (start==1) {
    tunes.play_screen();
  }
  //--------------------------------------------------------

  // EXPLORE SCREEN --------------------------------------
  else if (start==2) {
    tunes.explore();
  }
  //--------------------------------------------------------

  // INSTRUCTIONS SCREEN
  else if (start == 3) {
    tunes.instructions_screen();
  }
}

int position;
void mouseClicked() {

  //  On initial screen, there are two buttons i.e. PLAY and EXPLORE

  // To click on PLAY button on initial screen
  if (mouseX>85 && mouseX<355 && mouseY > 570 && mouseY < 630) {
    start = 1;
    clicks.play();
    clicks.rewind();
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  }

  // To click on EXPLORE button on initial screen
  if (mouseX>85 && mouseX<355 && mouseY>670 && mouseY<730) {
    start = 2;
    clicks.play();
    clicks.rewind();
  }

  // INSTRUCTIONS BUTTON CLICK
  if (mouseX>400 && mouseX<445 && mouseY>750 && mouseY<795) {
    clicks.play();
    clicks.rewind();
    tunes.instructions_screen();
  }

  // When on PLAY screen (start == 1)
  if (start==1) {

    // RESTART button 
    if (mouseX>390 && mouseX<450 && mouseY>0 && mouseY<50) {
      playlist[which_song].pause();
      playlist[which_song].rewind();
      playlist[which_song].play();
      clicks.play();
      clicks.rewind();
    }

    // PROGRESS BAR
    if (mouseX > 45 && mouseX < width - 45 && mouseY > 430 && mouseY < 460) {
      position = int( map( mouseX, 45, width - 45, 0, playlist[which_song].length() ) );
      playlist[which_song].cue( position );
    }

    // NEXT feature
    if (mouseX>310 && mouseX<350 && mouseY>505 && mouseY<530) {
      playlist[which_song].pause(); // to pause the current song and move on to the next one

      // since the total number of songs is 6, so the user shouldn't go beyond that
      if (which_song<5 && which_artist<5) {
        clicks.play();
        clicks.rewind();
        which_song+=1;
        which_artist+=1;
      }
      playlist[which_song].play(); // playing the next song
    } 

    // PREVIOUS feature
    else if (mouseX>100 && mouseX<140 && mouseY>505 && mouseY<530) {
      playlist[which_song].pause();// to pause the current song and move on to the next one

      // the user shouldn't go below 0 and crash the program
      if (which_song>0 && which_artist>0) {
        clicks.play();
        clicks.rewind();
        which_song-=1;
        which_artist-=1;
      }
      playlist[which_song].play(); // playing the next song
    }
  }

  // if the user is either on PLAY or EXPLORE screen
  if (start==1 || start==2 || start==3) {

    // BACK button
    if (mouseX>10 && mouseX<50 && mouseY>10 && mouseY<50) {
      start = 0; // keeps track of screen no.
      clicks.play();
      clicks.rewind();
      playlist[which_song].pause(); // pauses the song when the user goes to initial screen
      back_press = true;
    }
  }

  // if the user is on EXPLORE screen
  if (start==2) {
    back_press=false;

    // Box 1
    if (mouseX>173 && mouseX<213 && mouseY>90 && mouseY < 130) {
      start=1;
      clicks.play();
      clicks.rewind();
      which_song=0;
      which_artist=0;
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    } 

    // Box 2
    else if (mouseX>390 && mouseX<430 && mouseY>90 && mouseY < 130) {
      start=1;
      clicks.play();
      clicks.rewind();
      which_song=1;
      which_artist=1;
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    } 

    // Box 3
    else if (mouseX>390 && mouseX<430 && mouseY>315 && mouseY < 355) {
      start=1;
      clicks.play();
      clicks.rewind();
      which_song=3;
      which_artist=3;
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    } 

    // Box 4
    else if (mouseX>173 && mouseX<213 && mouseY>315 && mouseY < 355) {
      start=1;
      clicks.play();
      clicks.rewind(); 
      which_song=2;
      which_artist=2;
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    } 

    // Box 5
    else if (mouseX>173 && mouseX<213 && mouseY>540 && mouseY < 580) {
      start=1;
      clicks.play();
      clicks.rewind();
      clicks.play();
      clicks.rewind();
      which_song=4;
      which_artist=4;
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    } 

    // Box 6
    else if (mouseX>390 && mouseX<430 && mouseY>540 && mouseY < 580) {
      start=1;
      clicks.play();
      clicks.rewind();
      which_song=5;
      which_artist=5;
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    }
  }
}

int position2;
void mouseReleased() {

  // PROGRESS BAR functionality on click
  if (mouseX > 45 && mouseX < width - 45 && mouseY > 430 && mouseY < 460) {
    position2 = int( map( mouseX, 45, width - 45, 0, playlist[which_song].length() ) );
    playlist[which_song].cue( position2 );
  }

  // PAUSE / PLAY button functionality on click
  if (mouseX > 197 && mouseX<252 && mouseY > 493 && mouseY<558) {
    // PAUSE
    if (click_number%2==0) {
      clicks.play();
      clicks.rewind();
      rotate = false;
      pause = true;
      playlist[which_song].pause();
      click_number+=1;
    } 
    // PLAY
    else if (click_number%2!=0) {
      clicks.play();
      clicks.rewind();
      rotate = true;
      playlist[which_song].play();
      click_number+=1;
    }
  }
}


int mute_count=1; // to keep track of number of times mute functionlity is used by user

void keyPressed() {

  // MUTE
  if (keyCode == 'M' && mute_count%2!=0) {
    clicks.play();
    clicks.rewind();
    playlist[which_song].mute(); 
    mute_count+=1;
  } else if (keyCode == 'M' && mute_count%2==0) {
    clicks.play();
    clicks.rewind();
    playlist[which_song].unmute(); 
    mute_count+=1;
  }

  // PAUSE
  if (keyCode == 'P' && click_number%2==0) {
    clicks.play();
    clicks.rewind();
    rotate = false;
    pause = true;
    playlist[which_song].pause();
    click_number+=1;
  } else if (click_number%2!=0) {
    clicks.play();
    clicks.rewind();
    rotate=true;
    playlist[which_song].play();
    click_number+=1;
  }

  // RESTART
  if (keyCode == 'R') {
    clicks.play();
    clicks.rewind();
    playlist[which_song].pause();
    playlist[which_song].rewind();
    playlist[which_song].play();
  }

  // BACK
  if (keyCode == 'B') {
    clicks.play();
    clicks.rewind();
    if (start==1 || start==2 || start==3) {
      start = 0;
      playlist[which_song].pause();
      back_press = true;
    }
  }

  // On intital screen, to navigate to PLAY or EXPLORE screen
  if (keyCode == UP || key == ENTER) {
    if (start==0) {
      start=1;
      clicks.play();
      clicks.rewind();
      playlist[which_song].rewind(); 
      playlist[which_song].play();
    } else if (start==1) {
      volume+=5;
    }
  } else if (keyCode == DOWN) {
    if (start==0) {
      start=2;
      clicks.play();
      clicks.rewind();
    } else if (start==1) {
      volume-=5;
    }
  }

  // INSTRUCTIONS
  if (key == ' ' || keyCode == 'I') {
    tunes.instructions_screen();
    clicks.play();
    clicks.rewind();
  }

  // On EXPLORE screen (start == 2), choose songs using number keys 1 - 6
  if (start==2 && key=='1') {
    start=1;
    clicks.play();
    clicks.rewind();
    which_song=0;
    which_artist=0;
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  } else if (start==2 && key=='2') {
    start=1;
    clicks.play();
    clicks.rewind();
    which_song=1;
    which_artist=1;
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  } else if (start==2 && key=='3') {
    start=1;
    clicks.play();
    clicks.rewind();
    which_song=2;
    which_artist=2;
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  } else if (start==2 && key=='4') {
    start=1;
    clicks.play();
    clicks.rewind();
    which_song=3;
    which_artist=3;
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  } else if (start==2 && key=='5') {
    start=1;
    clicks.play();
    clicks.rewind();
    which_song=4;
    which_artist=4;
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  } else if (start==2 && key=='6') {
    start=1;
    clicks.play();
    clicks.rewind();
    which_song=5;
    which_artist=5;
    playlist[which_song].rewind(); 
    playlist[which_song].play();
  }
  //-----------------------------------------------------

  // CHANGE songs using RIGHT and LEFT keys instead of click
  if (keyCode == RIGHT) {
    playlist[which_song].pause();

    if (which_song<5 && which_artist<5) {
      which_song+=1;
      which_artist+=1;
      clicks.play();
      clicks.rewind();
    }
    playlist[which_song].play();
  } else if (keyCode == LEFT) {
    playlist[which_song].pause();

    if (which_song>0 && which_artist>0) {
      which_song-=1;
      which_artist-=1;
      clicks.play();
      clicks.rewind();
    }
    playlist[which_song].play();
  }
}
//--------------------------------------------------- END OF PROGRAM -----------------------------------------------
