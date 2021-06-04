/*
Name: Ronit Singh
Date: 7 June 2021
Title: Hand PixelArt 
*/

PImage hand;

void setup() {
  hand = loadImage("hand.jpg");                 // loading the hand image
  size(533, 800);
  noStroke();
  background(0);
  
  loadPixels();                                 // loading the pixels
  for (int x=0; x<hand.width; x+=10) {          // goes until the width of the image
    for (int y=0; y<hand.height; y+=10) {
      color c = hand.pixels[y*hand.width+x];    // extracting pixel values
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      int dotSize = 8;
      int opacity = 200;
      
      fill(r, 0, 0, opacity);                   // fill the ellipse with red from color c
      ellipse(random(x, x+10), random(y, y+10), dotSize, dotSize);
      
      fill(0, g, 0, opacity);                   // fill the ellipse with green from color c
      ellipse(random(x, x+10), random(y, y+10), dotSize, dotSize);
      
      fill(0, 0, b, opacity);                   // fill the ellipse with blue from color c
      ellipse(random(x, x+10), random(y, y+10), dotSize, dotSize);
    }
  }
  image(hand, 380, 0, 120, 170);                // sample hand image before pixelating 
}
