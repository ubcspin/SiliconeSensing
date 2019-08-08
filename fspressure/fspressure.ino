void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
  pinMode(A0, INPUT);   
  pinMode(A1, INPUT); 
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);  
  pinMode(A4, INPUT); 
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

  delay(3);
  val = analogRead(A1);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(3);
  val = analogRead(A2);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);
  
  val = analogRead(A3);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);
  val = analogRead(A4);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);
    
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  delay(3);
  
}
