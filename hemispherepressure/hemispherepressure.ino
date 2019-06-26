
int sending[] = {11, 10, 9, 6, 5, 3};
int ground[] = {8, 7, 4, 2, 13, 12};
int receiving[] = A0, A1, A2, A3, A4, A5};


void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
  pinMode(A0, INPUT); 
  pinMode(A1, INPUT); 
  pinMode(A2, INPUT); 
  pinMode(A3, INPUT); 
  pinMode(A4, INPUT); 
  pinMode(A5, INPUT); 
  
  pinMode(11, OUTPUT); 
  pinMode(10, OUTPUT); 
  pinMode(9, OUTPUT); 
  pinMode(6, OUTPUT); 
  pinMode(5, OUTPUT); 
  pinMode(3, OUTPUT);

  digitalWrite(11, HIGH);
  digitalWrite(10, HIGH);
  digitalWrite(9, HIGH);
  digitalWrite(6, HIGH);
  digitalWrite(5, HIGH);
  digitalWrite(3, HIGH);



  pinMode(8, OUTPUT); 
  pinMode(7, OUTPUT); 
  pinMode(4, OUTPUT); 
  pinMode(2, OUTPUT); 
  pinMode(13, OUTPUT); 
  pinMode(12, OUTPUT);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(4, LOW);
  digitalWrite(2, LOW);
  digitalWrite(13, LOW);
  digitalWrite(12, LOW);
  Serial.begin(9600);

}

void loop() {
//  TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
//  TCCR2B = _BV(WGM22) | _BV(CS20);
//  OCR0B = 50;
//  OCR1B = 50;
//  OCR2B = 50;
//  OCR0A = 50;
//  OCR1A = 50;
//  OCR2A = 50;
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(4, LOW);
  digitalWrite(2, LOW);
  digitalWrite(13, LOW);
  digitalWrite(12, LOW);
  int val = analogRead(A0);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(1);
  val = analogRead(A1);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(1);
  val = analogRead(A2);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(1);
  
  val = analogRead(A3);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(1);
  
  val = analogRead(A3);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(1);
  
  val = analogRead(A4);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(1);
  
  val = analogRead(A5);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(1);
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
//  delay(20 );
  
}
