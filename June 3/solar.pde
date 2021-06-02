/*
Name: Ronit Singh
Date: 3 June, 2021
Title: Planets of our Solar System
 */

//------------------------------------------------------------
//                 OUR SOLAR SYSTEM PLANETS 
//------------------------------------------------------------

float angle = 0; // used to rotate planets around

// Main class for all functions of planets
class Planets {

  // FUNCTION TO DRAW "ORBITS" OF ALL THE PLANETS
  void orbits() {
    noFill();
    stroke(255);
    ellipse(0, 0, 135, 135);
    ellipse(0, 0, 180, 180);
    ellipse(0, 0, 220, 220);
    ellipse(0, 0, 255, 255);
    ellipse(0, 0, 320, 320);
    ellipse(0, 0, 420, 420);
    ellipse(0, 0, 510, 510);
    ellipse(0, 0, 610, 610);
    ellipse(0, 0, 680, 680);
  }

  // FUNCTION TO PLACE ALL PLANETS IN ORBITS AND ROTATE THEM
  void planets_in_orbits() {

    // S U N
    fill(252, 215, 0);         
    ellipse(0, 0, 100, 100);  

    // below 2 lines apply to all planets
    pushMatrix();
    rotate(angle);

    // M E R C U R Y
    translate(100, 0);         // to determine the position of the planet
    fill(255);            
    ellipse(-33, 0, 10, 10);

    // V E N U S
    translate(100, 0);         
    fill(147, 91, 7);             
    ellipse(-190, -88, 15, 15);

    // E A R T H 
    translate(100, 0);         
    fill(4, 160, 201);            
    ellipse(-410, 0, 15, 15);  

    // M A R S
    translate(100, 0);         
    fill(255, 140, 0);             
    ellipse(-340, 111, 10, 10); 

    // J U P I T E R
    translate(100, 0);         
    fill(255, 179, 71);            
    ellipse(-570, 142, 42, 42); 

    // S A T U R N 
    translate(100, 0);         
    fill(240, 230, 140);             
    ellipse(-450, -150, 30, 30);
    noFill();
    ellipse(-450, -150, 45, 45);
    ellipse(-450, -150, 55, 55);

    // U R A N U S  
    translate(100, 0);         
    fill(74, 128, 152);            
    ellipse(-935, -100, 23, 23);

    // N E P T U N E
    translate(100, 0);        
    fill(2, 118, 170);            
    ellipse(-510, 100, 21, 21); 

    // P L U T O
    translate(100, 0);        
    fill(1, 86, 124);             
    ellipse(-910, -340, 10, 10);

    popMatrix();
  }

  // FUNCTION TO DISPLAY TEXT (TITLE and PLANET NAMES) ON CANVAS
  void display_text() {
    fill(255);
    textSize(50);

    pushMatrix();
    translate(-800, -10);
    text("P L A N E T S", 20, 20);
    popMatrix();

    pushMatrix();
    translate(-725, 50);
    textSize(20);
    text("S O L A R S Y S T E M", 0, 5);
    popMatrix();

    pushMatrix();
    translate(405, -300);
    fill(255);
    textSize(30);
    text("M E R C U R Y", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, -220);
    fill(147, 91, 7);
    textSize(30);
    text("V E N U S", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, -140);
    fill(4, 160, 201);
    textSize(30);
    text("E A R T H", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, -60);
    fill(255, 140, 0);
    textSize(30);
    text("M A R S", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, 20);
    fill(255, 179, 71);
    textSize(30);
    text("J U P I T E R", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, 100);
    fill(240, 230, 140);
    textSize(30);
    text("S A T U R N", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, 180);
    fill(74, 128, 152);
    textSize(30);
    text("U R A N U S", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, 260);
    fill(2, 118, 170);
    textSize(30);
    text("N E P T U N E", 150, 5);
    popMatrix();

    pushMatrix();
    translate(405, 340);
    fill(1, 86, 124);
    textSize(30);
    text("P L U T O", 150, 5);
    popMatrix();
  }
}

// Creating an object instantiation of Planets Class to use it's properties later on.
// Default constructor is called as I have not defined any constructor.
Planets p = new Planets();

void setup ()
{
  size(1800, 900);
}

void draw() {
  background(0);

  // centering everything and then placing objects relative to it.
  translate(width/2, height/2);

  p.orbits();

  p.planets_in_orbits();
  angle += 0.01;  

  p.display_text();
}
