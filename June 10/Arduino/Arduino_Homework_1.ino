/*
  Name: Ronit Singh
  Date: 10 June 2021
  HW: Arduino Homework 1
*/

// 3 Switchces
const int pushButton1 = A2;
const int pushButton2 = 4;
const int pushButton3 = A4;

// 3 LED Lights
const int blue = 13;
const int red = 9;
const int green = 2;

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input and LED's pin an output:
  pinMode(pushButton1, INPUT);
  pinMode(pushButton2, INPUT);
  pinMode(pushButton3, INPUT);
  pinMode(blue, OUTPUT);
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input pin:
  int buttonState1 = digitalRead(pushButton1);
  int buttonState2 = digitalRead(pushButton2);
  int buttonState3 = digitalRead(pushButton3);
  
  // according to the states of the button, perform specific action

  // Button/Switch 1 pressed
  if (buttonState1 == HIGH) {
    digitalWrite(red, HIGH);
    delay(100);
    digitalWrite(red, LOW);
    delay(100);

    digitalWrite(blue, HIGH);
    delay(100);
    digitalWrite(blue, LOW);
    delay(100);

    digitalWrite(green, HIGH);
    delay(100);
    digitalWrite(green, LOW);
    delay(100);
  }

  // Button/Switch 2 pressed
  else if (buttonState2 == HIGH) {
    digitalWrite(blue, HIGH);
    delay(500);
    digitalWrite(blue, LOW);
    delay(500);
    digitalWrite(blue, HIGH);
    delay(500);
    digitalWrite(blue, LOW);
    delay(500);

    digitalWrite(red, HIGH);
    delay(500);
    digitalWrite(red, LOW);
    delay(500);
    digitalWrite(red, HIGH);
    delay(500);
    digitalWrite(red, LOW);
    delay(500);

    digitalWrite(green, HIGH);
    delay(500);
    digitalWrite(green, LOW);
    delay(500);
    digitalWrite(green, HIGH);
    delay(500);
    digitalWrite(green, LOW);
    delay(500);


  }

  // Button/Switch 3 pressed
  else if (buttonState3 == HIGH) {
    digitalWrite(red, HIGH);
    delay(1000);
    digitalWrite(blue, HIGH);
    delay(1000);
    digitalWrite(green, HIGH);
    delay(1000);
    digitalWrite(green, LOW);
    delay(1000);
    digitalWrite(blue, LOW);
    delay(1000);
    digitalWrite(red, LOW);
  }
}
