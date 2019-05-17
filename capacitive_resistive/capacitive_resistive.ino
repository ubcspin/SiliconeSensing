
int sensorPin = A0;    // select the input pin for the potentiometer
long sensorValue = 0;  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
// 893 Hz
int freqs = 158;
int c = 0;
//CAPACITIVE SETUP
#include <CapacitiveSensor.h>

CapacitiveSensor cs_4_2 = CapacitiveSensor(4,2); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil

CapacitiveSensor cs_6_3 = CapacitiveSensor(6,3); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil

void setup() {
//  cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF); // turn off autocalibrate on channel 1 - just as an example Serial.begin(9600);

//  pinMode(3, OUTPUT);  
  pinMode(11, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(4, INPUT);
  pinMode(2, INPUT);
//  pinMode(5, OUTPUT);
  Serial.begin(9600);  

}

void loop() {
  c++;
   
  pinMode(11, OUTPUT);
  pinMode(7, OUTPUT);
    TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(WGM22) | _BV(CS20);
  OCR2B = 50;    
  OCR2A = freqs;
  pinMode(4, INPUT);
  pinMode(2, INPUT);
  
  pinMode(6, INPUT);
  pinMode(3, INPUT);
  digitalWrite(7, LOW);

//  digitalWrite(5, HIGH);
//  for(int i = 0; i < 10; i++){
    sensorValue = 0;
//  }


   for(int j =0; j < 80; j++){
    sensorValue += analogRead(sensorPin);
  }
  

    int val = sensorValue/100;
    Serial.write(lowByte(val));
    Serial.write(highByte(val));
 

   delay(3);
//  write capacitive info
  pinMode(11, INPUT);
  pinMode(7, INPUT);
  
long total1=0;

  if(c%2 == 0){  
    pinMode(4, OUTPUT);
  pinMode(2, OUTPUT);
  for(int j =0; j < 5; j++){
   total1 += cs_4_2.capacitiveSensor(30);
  }
  Serial.write(lowByte(total1/5)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else{
  pinMode(6, OUTPUT);
  pinMode(3, OUTPUT);
  for(int j =0; j < 5; j++){
   total1 += cs_6_3.capacitiveSensor(30);
  }
  Serial.write(lowByte(total1/5)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  delay(3); // arbitrary delay to limit data to serial port
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  

}
