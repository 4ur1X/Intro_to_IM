/*
Name: Ronit Singh
Date: 21 June, 2021
Arduino Homework MUSIC TONE
*/

int buzzer = 11; // buzzer pin
const int pushButton = 8; // switch / button pin
int count = 200; // initial pitch for the buzzer
int potentiometer = A5; // potentiometer pin

void setup() {
  Serial.begin(9600);
  pinMode(pushButton, INPUT);
}

void loop() {
  int buttonState = digitalRead(pushButton);
  int knobValue = analogRead(potentiometer);

  // map value from of potentiometer from 0 to 255
  int num = map(knobValue, 0, 1024, 0, 255);

  // on button press, change the pitch
  if (buttonState == HIGH) {
    count += 50;
  }

  // buzzer play
  tone(buzzer, count);
  delay(num);
  noTone(buzzer);
  delay(num);

}
