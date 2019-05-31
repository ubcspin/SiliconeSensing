
int topLeftPin = A0; //red
int topRightPin = A5; //green
int rightTopPin = A3; //green
int rightBottomPin = A2; //yellow
int bottomRightPin = A1; //black
int bottomLeftPin = A4;// black
int leftBottomPin = A7; //orange
int leftTopPin = A6; //red
long sensorValue[8] = {0,0,0,0,0,0,0,0};  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
//  702 Hz
int freq = 177;



void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power
  pinMode(41, INPUT); //top left digital
  pinMode(31, INPUT); //top right digital
  pinMode(35, INPUT); //right top digital
  pinMode(37, INPUT); // right bottom digital  
  pinMode(39, INPUT); // bottom right digital
  pinMode(33, INPUT); // bottom left digital
  pinMode(27, INPUT); // left bottom digital
  pinMode(29, INPUT); // left top digital
  
  pinMode(40, INPUT);//top left power
  pinMode(30, INPUT );//top right power
  pinMode(34, INPUT); //right top power
  pinMode(36, INPUT); //right bottom power
  pinMode(38, INPUT); // bottom right power
  pinMode(32, INPUT); // bottom left power
  pinMode(26, INPUT); // left bottom power
  pinMode(28, INPUT); // left top power
  Serial.begin(9600);

}

void loop() {
   pinMode(40, OUTPUT); //turn on top left
   digitalWrite(40, HIGH); //turn on top left
   pinMode(31, OUTPUT); //recieve on top right
   delay(2);
   Serial.println(analogRead(rightTopPin)- analogRead(rightBottomPin));
   Serial.println(analogRead(rightBottomPin) - analogRead(bottomRightPin));
   Serial.println(analogRead(bottomRightPin) - analogRead(bottomLeftPin));
   Serial.println(analogRead(bottomLeftPin) - analogRead(leftBottomPin));
   Serial.println(analogRead(leftBottomPin) - analogRead(leftTopPin));
   
   pinMode(40, INPUT); //turn off top left
   pinMode(31, INPUT); //turn off top right
   
   pinMode(30, OUTPUT); //turn on top right
   digitalWrite(30, HIGH); //turn on top right
   pinMode(35, OUTPUT); //recieve on right top
   delay(2);
   Serial.println(analogRead(rightBottomPin)- analogRead(bottomRightPin));
   Serial.println(analogRead(bottomRightPin) - analogRead(bottomLeftPin));
   Serial.println(analogRead(bottomLeftPin) - analogRead(leftBottomPin));
   Serial.println(analogRead(leftBottomPin) - analogRead(leftTopPin));
   Serial.println(analogRead(leftTopPin) - analogRead(topLeftPin));
   
   pinMode(30, INPUT); //turn off top right
   pinMode(35, INPUT); //turn off right top

   pinMode(34, OUTPUT); //turn on right top
   digitalWrite(34, HIGH); //turn on right top
   pinMode(37, OUTPUT); //recieve on right bottom
   delay(2);
   Serial.println(analogRead(bottomRightPin) - analogRead(bottomLeftPin));
   Serial.println(analogRead(bottomLeftPin) - analogRead(leftBottomPin));
   Serial.println(analogRead(leftBottomPin) - analogRead(leftTopPin));
   Serial.println(analogRead(leftTopPin) - analogRead(topLeftPin));
   Serial.println(analogRead(topLeftPin) - analogRead(topRightPin));
   
   pinMode(34, INPUT); //turn off right top
   pinMode(37, INPUT); //turn off right bottom

   pinMode(36, OUTPUT); //turn on right bottom
   digitalWrite(36, HIGH); //turn on right bottom 
   pinMode(39, OUTPUT); //recieve on bottom right
   delay(2);
   Serial.println(analogRead(bottomLeftPin) - analogRead(leftBottomPin));
   Serial.println(analogRead(leftBottomPin) - analogRead(leftTopPin));
   Serial.println(analogRead(leftTopPin) - analogRead(topLeftPin));
   Serial.println(analogRead(topLeftPin) - analogRead(topRightPin));
   Serial.println(analogRead(topRightPin) - analogRead(rightTopPin));
   
   pinMode(36, INPUT); //turn off right bottom
   pinMode(39, INPUT); //turn off bottom right


   pinMode(38, OUTPUT); //turn on bottom right
   digitalWrite(38, HIGH); //turn on bottom right
   pinMode(33, OUTPUT); //recieve on bottom left
   delay(2);
   Serial.println(analogRead(leftBottomPin) - analogRead(leftTopPin));
   Serial.println(analogRead(leftTopPin) - analogRead(topLeftPin));
   Serial.println(analogRead(topLeftPin) - analogRead(topRightPin));
   Serial.println(analogRead(topRightPin) - analogRead(rightTopPin));
   Serial.println(analogRead(rightTopPin) - analogRead(rightBottomPin));
   
   pinMode(38, INPUT); //turn off bottom right
   pinMode(33, INPUT); //turn off bottom left

   pinMode(32, OUTPUT); //turn on bottom left
   digitalWrite(32, HIGH); //turn on bottom left
   pinMode(27, OUTPUT); //recieve on left bottom
   delay(2);
   Serial.println(analogRead(leftTopPin)- analogRead(topLeftPin));
   Serial.println(analogRead(topLeftPin) - analogRead(topRightPin));
   Serial.println(analogRead(topRightPin) - analogRead(rightTopPin));
   Serial.println(analogRead(rightTopPin) - analogRead(rightBottomPin));
   Serial.println(analogRead(rightBottomPin) - analogRead(bottomRightPin));
   
   pinMode(32, INPUT); //turn off bottom left
   pinMode(27, INPUT); //turn off left bottom

   pinMode(26, OUTPUT); //turn on left bottom
   digitalWrite(26, HIGH); //turn on left bottom
   pinMode(29, OUTPUT); //recieve on left top
   delay(2);
   Serial.println(analogRead(topLeftPin) - analogRead(topRightPin));
   Serial.println(analogRead(topRightPin) - analogRead(rightTopPin));
   Serial.println(analogRead(rightTopPin) - analogRead(rightBottomPin));
   Serial.println(analogRead(rightBottomPin) - analogRead(bottomRightPin));
   Serial.println(analogRead(bottomRightPin) - analogRead(bottomLeftPin));
   
   pinMode(26, INPUT); //turn off left bottom
   pinMode(29, INPUT); //turn off left top
   
   pinMode(28, OUTPUT); //turn on left top
   digitalWrite(28, HIGH); //turn on left top
   pinMode(41, OUTPUT); //recieve on top left
   delay(2);
   Serial.println(analogRead(topRightPin) - analogRead(rightTopPin));
   Serial.println(analogRead(rightTopPin) - analogRead(rightBottomPin));
   Serial.println(analogRead(rightBottomPin) - analogRead(bottomRightPin));
   Serial.println(analogRead(bottomRightPin) - analogRead(bottomLeftPin));
   Serial.println(analogRead(bottomLeftPin) - analogRead(leftBottomPin));
   
   pinMode(28, INPUT); //turn off left top
   pinMode(41, INPUT); //turn off top left

   Serial.println("*********");
}
