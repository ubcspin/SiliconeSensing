int sending[] = {2, 3, 4, 5, 6, 7, 2};
int receiving[] = {A0, A1, A2, A3, A4, A5};

int buff[] = {0, 0, 0, 0, 0, 0, 222};
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

  for(int i = 0; i < 6; i++){
  
    pinMode(receiving[i], INPUT);
    pinMode(sending[i], OUTPUT);
    pinMode(sending[i+1], OUTPUT);
    digitalWrite(sending[i], HIGH);
    digitalWrite(sending[i+1], LOW);
    delay(30);
    int val = 0;
    
    for(int j =0; j < 1; j++){
      val += analogRead(receiving[i]);  
    }

    val = val/1;
  
    buff[i] = val;
    turnAllOff();
    
  }

for(int i = 0; i < 7; i++){

  Serial.write(lowByte(buff[i]));
  Serial.write(highByte(buff[i]));
}
}
