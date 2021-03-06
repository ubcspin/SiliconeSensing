void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
  pinMode(A0, INPUT); 
  pinMode(11, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(WGM22) | _BV(CS20);
  OCR2B = 50;
  int val = analogRead(A0);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  val = analogRead(A1);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  val = analogRead(A2);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  
  val = analogRead(A3);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  val = analogRead(A4);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  delay(20 );
  
}
