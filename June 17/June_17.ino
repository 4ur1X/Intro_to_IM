/*
  Name: Ronit Singh
  Date: 17 June 2021
  HW: Arduino Homework 2
*/

int light; // for analog sensor
const int led1 = 13;
const int led2 = A3;
const int pushButton = A2;

void setup() {
  Serial.begin(9600);
  pinMode(pushButton, INPUT);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
}

void loop() {
  light = analogRead(A0);
  int buttonState = digitalRead(pushButton);

  // if less light detect
  if (light < 20) {

    // only one of the two LEDs glow
    digitalWrite(led1, LOW);
    digitalWrite(led2, HIGH);

    // if switch / button pressed, then both LEDs blink
    if (buttonState == HIGH) {
      digitalWrite(led1, HIGH);
      delay(100);
      digitalWrite(led2, LOW);
      delay(100);

      digitalWrite(led2, HIGH);
      delay(100);
      digitalWrite(led1, LOW);
      delay(100);
    }
  }
  
  // if more light detect
  else if (light > 20) {

    // one of the other LEDs glow
    digitalWrite(led1, HIGH);
    digitalWrite(led2, LOW);

    // if switch / button pressed, then both LEDs blink
    if (buttonState == HIGH) {
      digitalWrite(led1, HIGH);
      delay(100);
      digitalWrite(led2, LOW);
      delay(100);

      digitalWrite(led2, HIGH);
      delay(100);
      digitalWrite(led1, LOW);
      delay(100);
    }
  }
}
