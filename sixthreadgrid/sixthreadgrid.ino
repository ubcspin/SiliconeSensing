
int topRightPin = A0; //yellow
int topMidPin = A1;
int topLeftPin = A2;
int rightTopPin = A3;
int rightMidPin = A4;
int rightBottomPin = A5;
long sensorValue[8] = {0,0,0,0,0,0,0,0};  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
//  702 Hz
int freq = 177;




int sending[3] = {A2, A1, A0};
int receiving[3] = {A3, A4, A5};

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
  Serial.begin(9600);

}

void loop() {
  Serial.write(lowByte(222));
  Serial.write(highByte(222));


  for(int j = 0; j <3; j++){
    for(int i = 0; i < 3; i++){
      pinMode(sending[i], OUTPUT);
      pinMode(receiving[j], OUTPUT);
      digitalWrite(sending[i], HIGH);
      digitalWrite(receiving[j], LOW);


      for(int n = 0; n < 3; n++){
        if(i != n){
        int a = analogRead(sending[n]);
        Serial.write(lowByte(a));
        Serial.write(highByte(a));
        }
      }

      
      for(int n = 0; n < 3; n++){
        if(j != n){
        int a = analogRead(receiving[n]);
        Serial.write(lowByte(a));
        Serial.write(highByte(a));
        }
      }

      pinMode(sending[i], INPUT);
      pinMode(receiving[j], INPUT);
    }
  }
}
