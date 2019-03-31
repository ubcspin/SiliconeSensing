
int topLeftPin = A0;
int bottomLeftPin = A1;
int bottomRightPin = A2;
int topRightPin = A3;// select the input pin for the potentiometer
long sensorValue[4] = {0,0,0,0};  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
//  702 Hz
int freq = 177;



void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
  pinMode(0, INPUT); //top right digital
  pinMode(1, INPUT); //bottom right digital
  pinMode(2, INPUT); //bottom left digital
  pinMode(3, INPUT); // top left digital
  
  pinMode(4, INPUT);//top right power
  pinMode(5, INPUT );//bottom right power
  pinMode(6, INPUT); //bottom left power
  pinMode(7, INPUT); //top left power
  Serial.begin(9600);

  
}

void loop() {
   pinMode(4, OUTPUT); //turn on top right
   digitalWrite(4, HIGH); //turn on top right
   pinMode(1, OUTPUT); //recieve on bottom right
   delay(2);
   Serial.println(analogRead(topLeftPin));
 //  Serial.println("BOTTOM LEFT: "+analogRead(bottomLeftPin));
   pinMode(4, INPUT); //turn off top right
   pinMode(1, INPUT); //turn off bottom right

   pinMode(5, OUTPUT); //turn on bottom right
   digitalWrite(5, HIGH); //turn on bottom right
   pinMode(2, OUTPUT); //recieve on bottom left
   delay(2);
   Serial.println(analogRead(topLeftPin));
 //  Serial.println("TOP RIGHT: "+analogRead(topRightPin));
   pinMode(5, INPUT); //turn off bottom right
   pinMode(2, INPUT); //turn off bottom left

   pinMode(6, OUTPUT); //turn on bottom left
   digitalWrite(6, HIGH); //turn on bottom left
   pinMode(3, OUTPUT); //recieve on top left
   delay(2);
  // Serial.println("TOP RIGHT: "+analogRead(topRightPin));
  // Serial.println("BOTTOM RIGHT: "+analogRead(bottomRightPin));
   pinMode(6, INPUT); //turn off bottom left
   pinMode(3, INPUT); //turn off top left

   pinMode(7, OUTPUT); //turn on top left
   digitalWrite(7, HIGH); //turn on top left
   pinMode(0, OUTPUT); //recieve on top right
   delay(2);
   //Serial.println("BOTTOM LEFT: " +analogRead(bottomLeftPin));
   //Serial.println("BOTTOM RIGHT: "+analogRead(bottomRightPin));
   pinMode(7, INPUT); //turn off top left
   pinMode(0, INPUT); //turn off top right
   
// // pinMode(11, OUTPUT);
//  TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
//  TCCR2B = _BV(WGM22) | _BV(CS20);
//  OCR2B = 50;
//  digitalWrite(5, HIGH);
//  for(int i = 0; i < 10; i++){
//    
//    sensorValue[i] = 0;
//  }
//    OCR2A = freq;
//    delay(1);
//   // if(i == 5)  digitalWrite(5, LOW);
//   for(int j =0; j < 100; j++){
//    sensorValue[0] += analogRead(topLeftPin);
//    sensorValue[1] += analogRead(bottomLeftPin);
//    sensorValue[2] += analogRead(bottomRightPin);
//    sensorValue[3] += analogRead(topRightPin);
//  }
//
//  //Send top left value
//  int tlval = sensorValue[0]/100;
//  
//  Serial.write(lowByte(tlval));
//  Serial.write(highByte(tlval));
//
//  //Send bottom left value
//  int blval = sensorValue[1]/100;  
//
//  Serial.write(lowByte(blval));
//  Serial.write(highByte(blval));
//
//  //Send bottom right value  
//  int brval = sensorValue[2]/100;  
//
//  Serial.write(lowByte(brval));
//  Serial.write(highByte(brval));
//
//  //Send top right value
//  int trval = sensorValue[3]/100;
//  
//  Serial.write(lowByte(trval));
//  Serial.write(highByte(trval));
//
//  
//    //******************************** delimiter
//  Serial.write(lowByte(222));
//  Serial.write(highByte(222));
//  
//  Serial.write(lowByte(222));
//  Serial.write(highByte(222));
//
//  
//  Serial.write(lowByte(222));
//  Serial.write(highByte(222));
//
//  
//  Serial.write(lowByte(222));
//  Serial.write(highByte(222));

}
