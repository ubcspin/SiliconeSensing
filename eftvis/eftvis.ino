
int topLeftPin = A5; //red
int bottomLeftPin = A4; //black
int bottomRightPin = A3; //yellow
int topRightPin = A2;// green
long sensorValue[4] = {0,0,0,0};  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
//  702 Hz
int freq = 177;



void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
  pinMode(2, INPUT); //top right digital
  pinMode(3, INPUT); //bottom right digital
  pinMode(4, INPUT); //bottom left digital
  pinMode(5, INPUT); // top left digital
  
  pinMode(11, INPUT);//top right power
  pinMode(10, INPUT );//bottom right power
  pinMode(9, INPUT); //bottom left power
  pinMode(8, INPUT); //top left power
  Serial.begin(9600);

}

void loop() {
   pinMode(11, OUTPUT); //turn on top right
   digitalWrite(11, HIGH); //turn on top right
   pinMode(3, OUTPUT); //recieve on bottom right
   delay(2);
   Serial.println(analogRead(topLeftPin));
   Serial.println(analogRead(bottomLeftPin));
   
   pinMode(11, INPUT); //turn off top right
   pinMode(3, INPUT); //turn off bottom right
   pinMode(10, OUTPUT); //turn on bottom right
   digitalWrite(10, HIGH); //turn on bottom right
   pinMode(4, OUTPUT); //recieve on bottom left
   delay(2);
   Serial.println(analogRead(topLeftPin));
   Serial.println(analogRead(topRightPin));
   pinMode(10, INPUT); //turn off bottom right
   pinMode(4, INPUT); //turn off bottom left

   pinMode(9, OUTPUT); //turn on bottom left
   digitalWrite(9, HIGH); //turn on bottom left
   pinMode(5, OUTPUT); //recieve on top left
   delay(2);
   Serial.println(analogRead(topRightPin));
   Serial.println(analogRead(bottomRightPin));
   pinMode(9, INPUT); //turn off bottom left
   pinMode(5, INPUT); //turn off top left

   pinMode(8, OUTPUT); //turn on top left
   digitalWrite(8, HIGH); //turn on top left
   pinMode(2, OUTPUT); //recieve on top right
   delay(2);
   Serial.println(analogRead(bottomLeftPin));
   Serial.println(analogRead(bottomRightPin));
   pinMode(8, INPUT); //turn off top left
   pinMode(2, INPUT); //turn off top right
   


}
