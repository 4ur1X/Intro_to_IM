/*
Name: Ronit Singh
 Date: 8 July 2021
 
 Final IM Project : NASCAR 2D Circuit Training Game using Arduino and Processing
 
 Components used ---------------
 ARDUINO: 3 Buttons (for accelerating forward, nitro or boost, horn), RGB LED Light, LCD Screen (16 x 2), Buzzer (Tone), Potentiometer
 PROCESSING: Images and sprites, Sound, Text, Transformations, Animation 
 */

#include<LiquidCrystal.h>

// variables for pins
int buttonPin1 = 2;
int buzzer = 7;
int buttonPin2 = 4;
int buttonPin3 = 8;
const int C1 = 10;
const int C2 = 11;
const int C3 = 12;

int pot; // potentiometer

int Contrast = 118; // alternative option of potentiometer for LCD screen contrast
LiquidCrystal lcd(5, 6, A5, A4, A3, A2);

void setup() {
  // turn on internal pull-up resistor
  pinMode( buttonPin1, INPUT_PULLUP );
  pinMode( buttonPin2, INPUT_PULLUP );
  pinMode( buttonPin3, INPUT_PULLUP );

  // display to LCD
  analogWrite(3, Contrast);
  lcd.begin(16, 2);
  lcd.setCursor(3, 0);
  lcd.print("NASCAR 2D");
  lcd.setCursor(0,1);
  lcd.print("Happy Driving :)");

  // start Serial
  Serial.begin( 9600 );
  Serial.setTimeout(50);
}

void loop() {
  
  // potentiometer
  pot = (analogRead(A0) / 4); // dividing by 4 to max out to 255 since the range is from 0 to 1023
  Serial.write(pot);

  // read in value
  int buttonValue1 = digitalRead( buttonPin1);
  int buttonValue2 = digitalRead( buttonPin2);
  int buttonValue3 = digitalRead( buttonPin3);

  // print out value
  Serial.print( buttonValue1 );
  Serial.print( "," );
  Serial.print( buttonValue2 );
  Serial.print( "," );
  Serial.println( buttonValue3 );
  
  // if button pressed, then play horn sound
  if ( buttonValue2 == HIGH) {
    noTone(buzzer);
  }
  else {
    tone(buzzer, 450);
  }

  // depending on which button pressed, light up either green, red, purple or yellow. 
  if ( buttonValue1 == LOW) {
    analogWrite(C1, 250);
    analogWrite(C2, 10);
    analogWrite(C3, 20);
  }
  else if ( buttonValue3 == LOW) {
    analogWrite(C1, 0);
    analogWrite(C2, 100);
    analogWrite(C3, 220);
  }
  else if ( buttonValue2 == LOW) {
    analogWrite(C1, 5);
    analogWrite(C2, 250);
    analogWrite(C3, 255);
  }
  else {
    analogWrite(C1, 0);
    analogWrite(C2, 0);
    analogWrite(C3, 255);
  }
}
