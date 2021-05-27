/*
Name: Ronit Singh
Homework: 3 (31 May)
Title: Asteroid Escape
*/

// IMPORTING PACKAGE FOR SOUND / MUSIC
import ddf.minim.*;

AudioPlayer player;
Minim minim;

// IMAGES FOR ROCKET, ASTEROID and BACKGROUND
PImage rocket;
PImage bg;
PImage asteroid;

// position and speed of 100 stars
float star_x[] = new float[100]; 
float star_y[] = new float[100];
float speed[] = new float[100];

// position and speed of asteroids
float asteroid_x[] = new float[50];
float asteroid_y[] = new float[5];

// initial variable for loops
int i = 0;

void setup() {
  size(450, 800);

  // (EXTRA) BACKGROUND MUSIC and LOADING IMAGES
  extra_features();

  // STAR CHARACTERISTICS
  stroke(255);
  strokeWeight(3);

  // RANDOM PLACEMENT OF STARS AND ASTEROIDS USING LOOP
  placement_stars_asteroids();
}

void draw() {

  background(bg);

  // FUNCTIONS FOR STARS AND ASTEROIDS MOVEMENTS
  stars(i);
  asteroid(i);

  // ROCKET PLACEMENT
  image(rocket, mouseX-60, mouseY-70, 120, 170); // moving the rocket using mouse

  // DISPLAYING GAME TITLE
  display_text();
}

// FUNCTION TO DISPLAY GAME TITLE
void display_text() {
  fill(255);
  textSize(32);
  text("A S T E R O I D", 115, 35);
  text("E S C A P E", 140, 785);
}

// FUNCTION FOR STARS MOVEMENT 
void stars(int i) {
  while (i < 5) {
    image(asteroid, asteroid_x[i], asteroid_y[i], 55, 55); 
    asteroid_y[i] = asteroid_y[i] - speed[i];
    if (asteroid_y[i] < 0) {
      asteroid_y[i] = height;
    }
    i = i + 1;
  }
}

// FUNCTION FOR ASTEROIDS MOVEMENT 
void asteroid(int i) {
  while (i < 100) {
    point(star_x[i], star_y[i]); 
    star_y[i] = star_y[i] - speed[i];
    if (star_y[i] < 0) {
      star_y[i] = height;
    }
    i = i + 1;
  }
}

// FUNCTION FOR STARS AND ASTEROIDS PLACEMENT RANDOMLY
void placement_stars_asteroids() {
  for (int i=0; i<5; i++) {
    asteroid_x[i] = random(width);
    asteroid_y[i] = random(height);
    speed[i] = random(1, 5);
  }
  for (int i=0; i<100; i++) {
    star_x[i] = random(width);
    star_y[i] = random(height);
    speed[i] = random(1, 5);
  }
}

// FUNCTION TO ADD EXTRA FEATURES
void extra_features() {
  minim = new Minim(this);
  player = minim.loadFile("starsong.mp3");
  player.play();
  player.loop();
  rocket = loadImage("rocket.png");
  bg = loadImage("bg2.png");
  asteroid = loadImage("asteroid.png");
  background(bg);
}
