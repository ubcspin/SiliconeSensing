int sending[] = {2, 3, 4, 5};
int receiving[] = {A0, A1, A2, A3};

int buff[] = {0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0,0, 0, 0, 0, 222};
void setup() {
  // put your setup code here, to run once:


  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);

  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  Serial.begin(9600);
  
}

void turnAllOff(){
  for(int i = 0; i<4; i++){
    pinMode(sending[i], INPUT);
    pinMode(receiving[i], OUTPUT);
  }
  
}

void loop() {

  for(int i = 0; i < 4; i++){

    pinMode(sending[i], OUTPUT);
    for(int j = 0; j <4; j++){   
      digitalWrite(sending[i], HIGH);  
      pinMode(receiving[j], INPUT);
      delay(5);
      int val = 0;
       

      val += analogRead(receiving[j]);  
     
    
      buff[(i*4)+j] = val;
        pinMode(receiving[j], OUTPUT);
      turnAllOff();
//      delay(2);
    }
    
//    delay(2);
//    for(int j = 0; j < 6; j++){
//    pinMode(receiving[j], INPUT);
//    }
  }

for(int i = 0; i < 17; i++){
  Serial.write(lowByte(buff[i]));
  Serial.write(highByte(buff[i]));
}
}
