int sending[] = {2, 3, 4, 5, 6, 7};
int receiving[] = {A0, A1, A2, A3, A4, A5};
void setup() {
  // put your setup code here, to run once:


  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);

  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(9600);
  
}

void turnAllOff(){
  for(int i = 0; i<6; i++){
    pinMode(sending[i], INPUT);
    pinMode(receiving[i], OUTPUT);
  }
  
}

void loop() {

  Serial.write(lowByte(222));
  Serial.write(highByte(222));

  for(int i = 0; i < 6; i++){
  
    pinMode(sending[i], OUTPUT);
    pinMode(receiving[i], INPUT);
    digitalWrite(sending[i], HIGH);
    delay(20);
    int val = 0;
    
    for(int j =0; j < 1; j++){
      val += analogRead(receiving[i]);  
    }

    val = val/1;
  
    Serial.write(lowByte(val));
    Serial.write(highByte(val));
    turnAllOff();
    
    delay(10);
//    for(int j = 0; j < 6; j++){
//    pinMode(receiving[j], INPUT);
//    }
  }

}
