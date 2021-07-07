/*
Name: Ronit Singh
 Date: 8 July 2021
 
 Final IM Project : NASCAR 2D Circuit Training Game using Arduino and Processing
 
 Components used ---------------
 ARDUINO: 3 Buttons (for accelerating forward, nitro or boost, horn), RGB LED Light, LCD Screen (16 x 2), Buzzer (Tone), Potentiometer
 PROCESSING: Images and sprites, Sound, Text, Transformations, Animation 
 */

/*
Different screen modes or states (for reference)
 0 - initial screen
 11 - story preview
 1 - mode screen
 2 - track screen
 3 - customize screen
 4 - instructions screen
 5 - gameplay
 6 - game over screen
 */

import ddf.minim.*;  // minim music library
import processing.serial.*; // for arduino communication

Serial myPort; // serial port

Car car; // Car class

Minim minim;
AudioPlayer loadscreen_song;

//------------------------------------------------------
// VARIABLES
PImage[] track; // array of 3 race track images

// array of 3 different car models
PImage[] car1;
PImage[] car2;
PImage[] car3;

PImage needle; // for compass direction needle
PImage sidescreen, mode1, mode2;
PImage story, star, star2, star3;
PImage choose_track_screen, choose_mode_screen, instructions_screen;
PImage loadscreen, customize_screen;

PVector trackPos;
boolean move = false;
boolean restart = false;

// default car speeds for 3 different models
float car1_speed = 30;
float car2_speed = 20;
float car3_speed = 10;
float speed;
int total_lap;
int lap;
int time;

// STEERING by Potentiometer
float angle; // rotation of the car
float mapval;
int val;
float steering_sensitivity = 6.5;

int start = 0; // keeps track of screen states
int mode = 1;
int click_color;
int car_model = 1;
int which_track=0;
boolean play = false;
int size=3;

// Start is start and end 
PVector startPos, startSize;
PVector checkpointPos, checkpointSize;
boolean checkpointCleared = false;

boolean raceStarted = false;

float raceTime = 0; // keeps track of number of seconds passed

void setup() {
  size(1200, 675);

  minim = new Minim(this);
  loadscreen_song = minim.loadFile("song.mp3");

  // loading all images
  needle =loadImage("needle.png");
  sidescreen = loadImage("sidescreen.png");
  loadscreen = loadImage("loadscreen.png");
  story = loadImage("story.png");
  choose_track_screen = loadImage("choose_track_screen.png");
  choose_mode_screen = loadImage("choose_mode_screen.png");
  customize_screen = loadImage("customize_screen.png");
  instructions_screen = loadImage("instructions_screen.png");
  mode1 = loadImage("mode1.png");
  mode2 = loadImage("mode2.png");
  star = loadImage("star.jpg");
  star2 = loadImage("star2.jpg");
  star3 = loadImage("star3.jpg");

  // loading the 3 race track images
  track = new PImage[3];
  for (int i=0; i<3; i++) {
    track[i] = loadImage("track"+i+".jpg");
  }

  // zoom the race track
  track[0].resize(track[0].width*size, track[0].height*size);
  track[1].resize(track[1].width*size, track[1].height*size);
  track[2].resize(track[2].width*size, track[2].height*size);

  // Car class instantiation
  car = new Car(width/2-160, height/2);

  trackPos = new PVector(0, 0);
  startPos = new PVector(width/2+20, height/2-90);
  startSize = new PVector(40, 300);

  checkpointPos = new PVector(1250, 700);
  checkpointSize = new PVector(1050, 250);

  // 6 different colors for 3 different car models
  car1 = new PImage[6];
  car2 = new PImage[6];
  car3 = new PImage[6];
  for (int i=0; i<6; i++) {
    car1[i] = loadImage("car" + i + ".png");
    car2[i] = loadImage("car2" + i + ".png");
    car3[i] = loadImage("car3" + i + ".png");
  }

  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  if (raceStarted == true) {
    raceTime += 1 / frameRate; // seconds timer
    if (mode == 1) {
      // 60 seconds is the max time to cover as many laps as possible
      if (int(raceTime) == 60) {
        start = 6; // go to the game over screen
      }
    }
  } else if (mode == 2) {
    if (raceStarted == false && int(raceTime) >= 1) {
      start = 6;
    } else raceStarted = false;
  }
  //println("Time: " + raceTime + " seconds");
  //println("Race on going: " + raceStarted);
  //println("LAP : " + lap_count);

  // initial screen
  if (start == 0) {
    image(loadscreen, 0, 0);
    loadscreen_song.play();
  } 
  // customize screen
  if (start == 3) {
    image(customize_screen, 0, 0);
    noFill();
    stroke(255);
    fill(255);
    String sf1 = nf(steering_sensitivity, 0, 2); // to display steering sensitivity value upto 2 decimal places
    String sf2 = "";
    if (car_model == 1) {
      sf2 = nf(car1_speed, 0, 1); // to display car speed value upto 1 decimal place
    } else if (car_model == 2) {
      sf2 = nf(car2_speed, 0, 1);
    } else if (car_model == 3) {
      sf2 = nf(car3_speed, 0, 1);
    }
    textSize(26);
    text(sf1, 586, 260);
    text(sf2, 586, 418);
    if (car_model == 1) {
      image(car1[0], 750, 325, 250, 140); // car 1
      image(star, 1050, 360, 25, 120);    // star rating
    } else if (car_model == 2) {
      image(car2[0], 750, 265, 260, 260); // car 2
      image(star2, 1050, 360, 25, 120);   // star rating
    } else if (car_model == 3) {
      image(car3[0], 760, 310, 240, 185); // car 3
      image(star3, 1050, 360, 25, 120);   // star rating
    }
    noFill();
    // choose color
    switch(click_color) {
    case 1:
      if (car_model == 1) image(car1[1], 750, 325, 250, 140);
      else if (car_model == 2) image(car2[1], 750, 265, 260, 260);
      else if (car_model == 3) image(car3[1], 760, 310, 240, 185);
      ellipse(764, 547, 50, 50);
      break;
    case 2:
      if (car_model == 1) image(car1[2], 750, 325, 250, 140);
      else if (car_model == 2) image(car2[2], 750, 265, 260, 260);
      else if (car_model == 3) image(car3[2], 760, 310, 240, 185);
      ellipse(820, 547, 50, 50);
      break;
    case 3:
      if (car_model == 1) image(car1[3], 750, 325, 250, 140);
      else if (car_model == 2) image(car2[3], 750, 265, 260, 260);
      else if (car_model == 3) image(car3[3], 760, 310, 240, 185);
      ellipse(878, 547, 50, 50);
      break;
    case 4:
      if (car_model == 1) image(car1[4], 750, 325, 250, 140);
      else if (car_model == 2) image(car2[4], 750, 265, 260, 260);
      else if (car_model == 3) image(car3[4], 760, 310, 240, 185);
      ellipse(938, 547, 50, 50);
      break;
    case 5:
      if (car_model == 1) image(car1[5], 750, 325, 250, 140);
      else if (car_model == 2) image(car2[5], 750, 265, 260, 260);
      else if (car_model == 3) image(car3[5], 760, 310, 240, 185);
      ellipse(998, 547, 50, 50);
      break;
    }
  }
  // mode screen
  if (start == 1) {
    image(choose_mode_screen, 0, 0);
  }
  // track screen
  if (start == 2) {
    image(choose_track_screen, 0, 0);
  }
  // instruction screen
  if (start == 4) {
    image(instructions_screen, 0, 0);
  }
  // story preview screen
  if (start == 11) {
    image(story, 0, 0);
  }
  // main gameplay
  if (start == 5) {
    gameplay();
  }
  // game over screen
  if (start == 6) {
    game_over();
  }
}

void mousePressed() {
  // Start button
  if (start == 0 && mouseX>870 && mouseX<1165 && mouseY>176 && mouseY<261) {
    start = 11;
  }
  // Customize button
  else if (start == 0 && mouseX>870 && mouseX<1165 && mouseY>298 && mouseY<383) {
    start = 3;
  }
  // Instructions button
  else if (start == 0 && mouseX>870 && mouseX<1165 && mouseY>418 && mouseY<503) {
    start = 4;
  }
  // back button on story
  if (start == 11 && mouseX>120 && mouseX<290 && mouseY>603 && mouseY<655) {
    start = 0;
  }
  // next button on story
  if (start == 11 && mouseX>908 && mouseX<1078 && mouseY>603 && mouseY<655) {
    start = 1; // mode
  }
  // choose mode 1
  if (start == 1 && mouseX>248 && mouseX<418 && mouseY>547 && mouseY<599) {
    mode = 1;
    start = 2;
  } else if (start == 1 && mouseX>770 && mouseX<940 && mouseY>547 && mouseY<599) {
    mode = 2;
    start = 2;
  }
  if (start == 3 && mouseX>515 && mouseX<685 && mouseY>595 && mouseY<647) {
    start = 0;
  }
  // customize car color
  if (start == 3) {
    if (mouseX>744 && mouseX<784 && mouseY>526 && mouseY<566) {
      click_color = 1;
    } else if (mouseX>800 && mouseX<840 && mouseY>526 && mouseY<566) {
      click_color = 2;
    } else if (mouseX>858 && mouseX<898 && mouseY>526 && mouseY<566) {
      click_color = 3;
    } else if (mouseX>918 && mouseX<958 && mouseY>526 && mouseY<566) {
      click_color = 4;
    } else if (mouseX>978 && mouseX<1018 && mouseY>526 && mouseY<566) {
      click_color = 5;
    }
    // car model
    if (car_model <= 2 && mouseX>901 && mouseX<940 && mouseY>595 && mouseY<635) {
      car_model +=1;
    } else if (car_model >= 2 && mouseX>816 && mouseX<856 && mouseY>595 && mouseY<635) {
      car_model -= 1;
    }
    // steering increase
    if (mouseX>523 && mouseX<563 && mouseY>233 && mouseY<273) {
      steering_sensitivity +=0.5;
    } 
    // steering decrease
    else if (mouseX>468 && mouseX<508 && mouseY>233 && mouseY<273) {
      steering_sensitivity -=0.5;
    }
    // speed increase
    if (mouseX>523 && mouseX<563 && mouseY>388 && mouseY<428) {
      if (car_model == 1) {
        car1_speed += 5;
      } else if (car_model == 2) {
        car2_speed += 5;
      } else if (car_model == 3) {
        car3_speed += 5;
      }
    } 
    // speed decrease
    else if (mouseX>468 && mouseX<508 && mouseY>388 && mouseY<420) {
      if (car_model == 1) {
        car1_speed -= 5;
      } else if (car_model == 2) {
        car2_speed -= 5;
      } else if (car_model == 3) {
        car3_speed -= 5;
      }
    }
  }
  // back button on instructions screen
  if (start == 4 && mouseX>120 && mouseX<290 && mouseY>603 && mouseY<655) {
    start = 0;
  }

  // choose track (3 types)
  if (start == 2 && mouseX>212 && mouseX<382 && mouseY>577 && mouseY<629) {
    which_track = 0;
    start = 5;
  } else if (start == 2 && mouseX>512 && mouseX<682 && mouseY>577 && mouseY<629) {
    which_track = 1;
    start = 5;
  } else if (start == 2 && mouseX>827 && mouseX<997 && mouseY>577 && mouseY<629) {
    which_track = 2;
    start = 5;
  }
  // game over screen
  if (start == 6) {
    // next button
    if (mouseX>906 && mouseX<1076 && mouseY>602 && mouseY<654) {
      raceStarted = false;
      checkpointCleared = false;
      start = 0;
      lap_count = 0;
      raceTime = 0;
    } else if (mouseX>716 && mouseX<886 && mouseY>602 && mouseY<654) {
      raceStarted = false;
      checkpointCleared = false;
      start = 5;
      lap_count = 0;
      raceTime = 0;
    }
  }
}

void keyPressed() {
  // 'X' for direct navigation to home screen
  if (key == 'x' || key == 'X') {
    start = 0;
    lap_count = 0;
    raceTime = 0;
  } 
  // 'R' for resetting the gameplay
  else if (key == 'r' || key == 'R') {
    restart = true;
    lap_count = 0;
    raceTime = 0;
    raceStarted = true;
    checkpointCleared = false;
  }
}

class Car {
  PVector pos;
  Car(float x, float y) {
    pos = new PVector(x, y);
    angle = 0;
    // setting customized car speed
    if (car_model == 1) {
      speed = car1_speed;
    } else if (car_model == 2) {
      speed = car2_speed;
    } else if (car_model == 3) {
      speed = car3_speed;
    }
  }
  // display the car
  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    // rotate according to potentiometer angle
    rotate(angle);
    if (car_model == 1) {
      car1[click_color].resize(0, 80);
      image(car1[click_color], -80, -40);
    } else if (car_model == 2) {
      car2[click_color].resize(0, 160);
      image(car2[click_color], -60, -80);
    } else if (car_model == 3) {
      car3[click_color].resize(0, 120);
      image(car3[click_color], -80, -60);
    }
    popMatrix();
  }
  void update() {
    updateAngle();
    updateMovement();
  }
  // some methods are of PVector class
  void updateAngle() {
    PVector vel = PVector.fromAngle(angle);
    vel.mult(speed);
  }
  void updateMovement() {
    if (move==false) return;

    //PVector vel = PVector.sub(new PVector(mouseX, mouseY), pos);
    PVector vel = PVector.fromAngle(angle);
    vel.mult(speed);

    if (vel.mag() < speed) return;

    vel.normalize();
    vel.mult(speed);
    // move background with the speed of the car
    movetrack(vel);
  }
}

// function to move background with the speed of car in an opposite direction
void movetrack(PVector vel) {
  vel.x = -vel.x;
  vel.y = -vel.y;
  startPos.add(vel);
  checkpointPos.add(vel);
  trackPos.add(vel);
}

void serialEvent(Serial myPort) {
  val = myPort.read(); // reads potentiometer value
  mapval = map(val, 125, 255, 0, steering_sensitivity);
  angle = mapval;

  // reads 3 button values
  String inString=myPort.readString(); // read in the string
  inString = trim( inString );  // remove any whitespace
  String values[] = split(inString, ",");
  // if the button is pressed, it sends a "0"
  // if button 1 pressed, move the car forward
  if ( values[0].equals("0") ) {
    move = true;
    // if button 2 pressed, apply boost and increase speed by 20
    if ( values[2].equals("0") ) {
      if (car_model == 1) {
        speed = car1_speed + 20;
      } else if (car_model == 2) {
        speed = car2_speed + 20;
      } else if (car_model == 3) {
        speed = car3_speed + 20;
      }
    } else {
      if (car_model == 1) {
        speed = car1_speed;
      } else if (car_model == 2) {
        speed = car2_speed;
      } else if (car_model == 3) {
        speed = car3_speed;
      }
    }
  } else {
    move = false;
    speed = 0;
  }
}

String lap_time = ""; // for displaying time

// function for the main gameplay
void gameplay() {
  background(0);

  image(track[which_track], trackPos.x, trackPos.y);
  image(sidescreen, 900, -35, 300, 730);

  // function to store the starting point
  updateStart();
  // function to store the checkpoint
  updateCheckpoint();

  //if (raceStarted) {
  //  fill(0, 255, 0);
  //} else {
  //  fill(255, 0, 0);
  //}
  //stroke(255, 0, 0);
  //strokeWeight(10);
  //rect(startPos.x, startPos.y, startSize.x, startSize.y);

  //if (checkpointCleared) {
  //  fill(0, 255, 0);
  //} else {
  //  noFill();
  //}
  //stroke(255, 0, 0);
  //strokeWeight(10);
  //rect(checkpointPos.x, checkpointPos.y, checkpointSize.x, checkpointSize.y);

  // user's choice among 3 different race tracks 
  if (which_track == 1) {
    image(track[which_track], 1000, 570, 95, 95);
  } else if (which_track == 0) {
    image(track[which_track], 950, 570, 205, 95);
  } else if (which_track == 2) {
    image(track[which_track], 985, 570, 125, 95);
  }
  
  // Compass to show direction
  pushMatrix();
  translate(1051, 430);
  rotate(mapval);
  image(needle, -51, -30);
  popMatrix();

  // display stats
  fill(255);
  textSize(32);
  text(int(speed), 970, 155);
  text(lap_count, 1005, 265);
  lap_time = nf(raceTime, 0, 2);
  text(lap_time, 1070, 265);

  car.show();
  car.update();
}

// function to store the checkpoint
void updateCheckpoint() {
  // if the car crosses the checkpoint
  if (isInsideRect(car.pos, checkpointPos, checkpointSize)) {
    checkpointCleared = true;
  }
}

// function to store the starting point
void updateStart() {
  // if the car starts from the start point and also crosses it
  if (isInsideRect(car.pos, startPos, startSize)) {
    lap_count+=1; // increase by 1 lap
    if (raceStarted == false && checkpointCleared == false) {
      raceStarted = true;
      //println("Race Started");
    } else if (checkpointCleared == true) {
      //If raceStarted then test if the checkpoint is clear 
      raceStarted = false;
      //println("Race finished");
    }
  }
}

int lap_count = -1; // value set to -1 to ignore the first start line crossover

// check if the car crosses the starting line and checkpoint
boolean isInsideRect(PVector p, PVector rp, PVector rs) {
  if (p.x > rp.x - rs.x/2 && p.x < rp.x + rs.x/2 && 
    p.y > rp.y - rs.y/2 && p.y < rp.y + rs.y/2) {
    return true;
  }
  return false;
}

// function for game over screen depending on 2 different modes
void game_over() {
  if (mode == 2) {
    if (raceStarted == false) {
      image(mode2, 0, 0);
      fill(0);
      textSize(64);
      text(raceTime, 663, 525);
    }
  } else if (mode == 1) {
    raceStarted = false;
    checkpointCleared = false;
    image(mode1, 0, 0);
    fill(0);
    textSize(64);
    text(lap_count, 668, 525);
  }
}
