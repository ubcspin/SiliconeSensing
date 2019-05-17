
int sensorPin = A0;    // select the input pin for the potentiometer
long sensorValue = 0;  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
// 893 Hz
int freqs = 158;
int c = 0;
//CAPACITIVE SETUP
#include <CapacitiveSensor.h>

CapacitiveSensor cs_53_52 = CapacitiveSensor(53,52); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_51_50 = CapacitiveSensor(51,50); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_49_48 = CapacitiveSensor(49,48); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_47_46 = CapacitiveSensor(47,46); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
//CapacitiveSensor cs_45_44 = CapacitiveSensor(45,44); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_43_42 = CapacitiveSensor(43, 42); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_41_40 = CapacitiveSensor(41,40); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_39_38 = CapacitiveSensor(39, 38); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
CapacitiveSensor cs_37_36 = CapacitiveSensor(37,36); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil


void setup() {
//  cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF); // turn off autocalibrate on channel 1 - just as an example Serial.begin(9600);

pinMode(53, INPUT);
pinMode(52, INPUT);
pinMode(51, INPUT);
pinMode(50, INPUT);
pinMode(49, INPUT);
pinMode(48, INPUT);
pinMode(47, INPUT);
pinMode(46, INPUT);
pinMode(43, INPUT);
pinMode(42, INPUT);
pinMode(41, INPUT);
pinMode(40, INPUT);
pinMode(39, INPUT);
pinMode(38, INPUT);
pinMode(37, INPUT);
pinMode(36, INPUT);
  
  Serial.begin(115200);  

}

void loop() {
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  delay(3);
//  write capacitive info



for(int c = 0; c < 8; c++){
long total1=0;
  if(c==0){    
  pinMode(53, OUTPUT);
  pinMode(52, OUTPUT);
  pinMode(51, INPUT);
  pinMode(50, INPUT);
  pinMode(49, INPUT);
  pinMode(48, INPUT);
  pinMode(47, INPUT);
  pinMode(46, INPUT);
  pinMode(43, INPUT);
  pinMode(42, INPUT);
  pinMode(41, INPUT);
  pinMode(40, INPUT);
  pinMode(39, INPUT);
  pinMode(38, INPUT);
  pinMode(37, INPUT);
  pinMode(36, INPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_53_52.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  
  }
  else if(c==1){
  pinMode(53, INPUT);
  pinMode(52, INPUT);
  pinMode(51, OUTPUT);
  pinMode(50, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_51_50.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else if(c==2){

    pinMode(51, INPUT);
    pinMode(50, INPUT);
    pinMode(49, OUTPUT);
    pinMode(48, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_49_48.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else if(c==3){

    pinMode(49, INPUT);
    pinMode(48, INPUT);
    pinMode(47, OUTPUT);
    pinMode(46, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_47_46.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else  if(c==4){

    pinMode(47, INPUT);
    pinMode(46, INPUT);
    pinMode(43, OUTPUT);
    pinMode(42, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_43_42.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else if(c==5){

    pinMode(43, INPUT);
    pinMode(42, INPUT);
    pinMode(41, OUTPUT);
    pinMode(40, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_41_40.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else if(c==6){

    pinMode(41, INPUT);
    pinMode(40, INPUT);
    pinMode(39, OUTPUT);
    pinMode(38, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_39_38.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }
  else if(c==7){

    pinMode(39, INPUT);
    pinMode(38, INPUT);
    pinMode(37, OUTPUT);
    pinMode(36, OUTPUT);
  for(int i = 0; i<1; i++){

   total1 += cs_37_36.capacitiveSensorRaw(30);
  }
  total1 = total1/1;
  
  Serial.write(lowByte(total1)); // print sensor output 1
  Serial.write(highByte(total1)); // print sensor output 1
  }

  delay(10); // arbitrary delay to limit data to serial port
}

}
