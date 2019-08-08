

int numpins = 5;
int pins[] = {2, 3, 4, 5, 6};

void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power

  Serial.begin(9600);

}

//void chargePair(int a, int b){
//  pinMode(pins[a], OUTPUT);
//  pinMode(pins[b], OUTPUT);
//
////  for(int i = 0; i<numpins; i++){
////    if(i != a && i != b){
////    pinMode(pins[i], INPUT);
////    }
////  }
//
//  digitalWrite(pins[a], HIGH);
//  digitalWrite(pins[b], LOW);
//  
//}
//
//void measureTheRest(int a, int b){
//  for(int i = 0; i< numpins; i++){
//    if(i != a && i != b){
//      int val = analogRead(pins[i]);
//      Serial.write(lowByte(val));
//      Serial.write(highByte(val));
//    }
//  }
//}

void loop() {
  digitalWrite(2, HIGH);
  pinMode(A0, INPUT);
  delay(3);
  int val = analogRead(A0);
      Serial.write(lowByte(val));
      Serial.write(highByte(val));

  pinMode(A0, OUTPUT);

  
  digitalWrite(2, HIGH);
  pinMode(A1, INPUT);
  delay(3);
  val = analogRead(A1);
      Serial.write(lowByte(val));
      Serial.write(highByte(val));
  pinMode(A1, OUTPUT);
  delay(3);
  digitalWrite(2, HIGH);
  pinMode(A2, INPUT);
  delay(3);
  val = analogRead(A2);
      Serial.write(lowByte(val));
      Serial.write(highByte(val));
  pinMode(A2, OUTPUT);
  
  delay(3);
  digitalWrite(2, HIGH);
  pinMode(A3, INPUT);
  delay(3);
  val = analogRead(A3);
      Serial.write(lowByte(val));
      Serial.write(highByte(val));

  pinMode(A3, OUTPUT);

  delay(3);
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  delay(3);
  
}
