/*
Name: Ronit Singh
 Date: 28 June 2021
 Homework: Arduino Processing Serial Communication Game
 */

import processing.serial.*;
import ddf.minim.*;

AudioPlayer player1;
AudioPlayer player2;
Minim minim;

Serial myPort; // serial port

int start = 0; // keep track of game screen
int X = 0; // to move the platform horizontally
float r = 0; // red
float g = 0; // green
float b = 0; // blue
int counter;
float ballX = 200;
float ballY = 100;
float speedX = 5;
float speedY = 0;
int hit = 0;
int miss = 0;
int time = 30; // max game time is 30 seconds

void serialEvent(Serial myPort) {
  String inString=myPort.readString(); // read in the string
  inString = trim( inString );  // remove any whitespace
  String values[] = split(inString, ",");
  println( values[0] );
  println( values[1] );
  // if the button is pressed, it sends a "0"
  if ( values[0].equals("0") ) {
    X+=2; // move platform right
  } else if (values[1].equals("0")) {
    X-=2; // move platfrom left
  }
}

// Function for actual game screen
void gameplay() {
  start = 0;
  counter = counter +1;
  if (counter%50==0)
  {
    //play sounds
    player1.play();
    player1.rewind();
    
    // to change background color randomly
    r = random(255);
    g = random(255);
    b = random(255);
    
    time-=1;
  }
  background(r, g, b);
  
  // platform (reduces it's size when hit)
  float platform = 1000/(hit+10);
  if (ballX < 11|| ballX > width) {
    speedX = -speedX;
  }
  if (ballY > height) { 
    speedY = -speedY;
    float distance = abs(X - ballX);
    if (distance < platform) {
      player2.play();
      player2.rewind();
      hit += 1;
    } else {
      miss += 1;
    }
  } else { 
    speedY += 1;
  }
  ballX += speedX;
  ballY += speedY;
  noStroke();
  fill(255);
  ellipse (ballX, ballY, 50, 50);  
  fill(255, 255, 255);
  rect(X-platform, height-10, 2*platform, 10);

  fill(255, 255, 255);
  textSize(25);
  text("POINTS: " + hit, 5, 25);
  text("MISS: " + miss, 5, 50);
  text("TIME: " + time, 480, 30);
}

// Function for Game Over screen
void gameover() {
  start = 1;
  player1.pause();
  player2.pause();
  background(0);
  text("S P A C E to restart", 200, 35);
  text("GAME OVER", 230, 150);
  text("FINAL SCORE", 225, 190);
  text("HITS - " + hit, 185, 260);
  text("MISS - " + miss, 325, 260);
  if (hit>miss) {
    text("YOU WIN!", 240, 320);
  } else if (hit<miss) {
    text("YOU LOSE!", 235, 320);
  } else {
    text("DRAW!", 250, 320);
  }
}

void setup() {
  size(600, 400);
  minim = new Minim(this);
  player1 = minim.loadFile("jump_sound_1.wav");
  player2 = minim.loadFile("jump_sound_2.wav");
  //println(Serial.list()); // print list of all ports
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  if (start==0) {
    gameplay();
    if (time == 0) {
      start=1;
      gameover();
    }
  }
}

// RESTART when clicked anywhere
void mouseClicked() {
  if (mouseX>0 && mouseX<width && mouseY > 0 && mouseY < height) {
    start = 0;
    time = 30;
    hit=0;
    miss=0;
  }
}

// RESTART when 'SPACE' key pressed
void keyPressed() {
  if (key == ' ') {
    start = 0;
    time = 30;
    hit=0;
    miss=0;
  }
}
