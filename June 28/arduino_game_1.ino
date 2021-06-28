// variables for pins
int buttonPin1 = A5;
int buttonPin2 = A4;

void setup() {
  // turn on internal pull-up resistor
  pinMode( buttonPin1, INPUT_PULLUP );
  pinMode( buttonPin2, INPUT_PULLUP );

  // start Serial
  Serial.begin( 9600 );
  Serial.setTimeout(50);
}

void loop() {
  // read in value
  int buttonValue1 = digitalRead( buttonPin1);
  int buttonValue2 = digitalRead( buttonPin2 );

  // print out value
  Serial.print( buttonValue1 );
  Serial.print( "," );
  Serial.println( buttonValue2 );

}
