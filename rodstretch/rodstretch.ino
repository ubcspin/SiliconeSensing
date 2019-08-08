void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
//  pinMode(A0, INPUT);   
//  pinMode(A1, INPUT); 
//  pinMode(A2, INPUT);
//  pinMode(A3, INPUT);  
//  pinMode(A4, INPUT); 
//  pinMode(11, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  pinMode(A0, OUTPUT);
  digitalWrite(A0, HIGH);

  pinMode(A2, OUTPUT);
  digitalWrite(A2, LOW);


  delay(10);
  pinMode(A1, INPUT);
  int val = analogRead(A1);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  Serial.write(lowByte(222));
  Serial.write(highByte(222));

    delay(10);
  
}
