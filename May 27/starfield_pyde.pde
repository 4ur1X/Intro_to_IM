/*
NAME: Ronit Singh
Homework: 2 (27th May)
Title: Starfield using for() and while() loops
*/

// IMPORTING PACKAGE FOR SOUND / MUSIC
import ddf.minim.*;

AudioPlayer player;
Minim minim;

// IMAGES FOR ROCKETS
PImage rocket;
PImage ufo;
PImage rocket2;
PImage bg;

// position and speed of 100 stars
float x[] = new float[100]; 
float y[] = new float[100];
float speed[] = new float[100];

void setup() {
  size(700, 500);
  
  // BACKGROUND MUSIC
  minim = new Minim(this);
  player = minim.loadFile("starsong.mp3");
  player.play();
  player.loop();

  // LOADING ROCKET IMAGES
  rocket = loadImage("rocket.png");
  ufo = loadImage("ufo.png");
  rocket2 = loadImage("rocket2.png");
  bg = loadImage("bg.png");
  background(bg);
  
  // STAR CHARACTERISTICS
  stroke(255);
  strokeWeight(4);

  // RANDOM PLACEMENT OF STARS USING LOOP
  for (int i=0; i<100; i++) {
    x[i] = random(width);
    y[i] = random(height);
    speed[i] = random(1, 5);
  }
}

void draw() {

  background(bg);

  // STAR MOVEMENT USING WHILE LOOP AND IF CONDITION
  int i = 0;
  while (i < 100) {
    point(x[i], y[i]); 
    x[i] = x[i] - speed[i];
    if (x[i] < 0) {
      x[i] = width;
    }
    i = i + 1;
  }
  
  // ROCKET PLACEMENT
  image(rocket, 100, 220, 170, 120);
  image(ufo, 180, 90, 170, 120);
  image(rocket2, 200, 350, 170, 120);

  // DISPLAYING TEXT
  fill(255);
  textSize(32);
  text("S T A R F I E L D", 240, 35);
  
}
