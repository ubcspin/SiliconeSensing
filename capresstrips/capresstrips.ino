
int sensorPin = A0;    // select the input pin for the potentiometer
long sensorValue = 0;  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
// 893 Hz
int freqs = 158;
int c = 0;
//CAPACITIVE SETUP
#include <CapacitiveSensor.h>
//
CapacitiveSensor caps[8] = {CapacitiveSensor(53,52), CapacitiveSensor(51,50), CapacitiveSensor(49,48),CapacitiveSensor(47,46), CapacitiveSensor(43, 42), CapacitiveSensor(41,40), CapacitiveSensor(39, 38),  CapacitiveSensor(37,36)  };
int pins[16] = {53, 52, 51, 50, 49, 48, 47, 46, 43, 42, 41, 40, 39, 38, 37, 36};

void setup() {
//
  for(int i = 0; i< 16; i++){
    pinMode(pins[i], INPUT);
  }
  Serial.begin(9600);  

}

void loop() {
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  delay(3);
  //  write capacitive info

  for(int c = 0; c < 8; c++){
    long total1=0;
    
    for(int i = 0; i< 16; i++){
      pinMode(pins[i], INPUT);
    }
    pinMode(pins[c*2], OUTPUT);
    pinMode(pins[c*2+1], OUTPUT);
    for(int i = 0; i<1; i++){
      total1 += caps[c].capacitiveSensorRaw(30);
    }
    total1 = total1/1;
    Serial.write(lowByte(total1)); // print sensor output 1
    Serial.write(highByte(total1)); // print sensor output 1
  
    delay(10); // arbitrary delay to limit data to serial port
  }

//  pinMode(11, OUTPUT);
//  pinMode(7, OUTPUT);
//    TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
//  TCCR2B = _BV(WGM22) | _BV(CS20);
//  OCR2B = 50;    
//  OCR2A = freqs;
//  digitalWrite(7, LOW);
////  for(int i = 0; i< 16; i++){
////    pinMode(pins[i], INPUT);
////  }
//
//  sensorValue = 0;
//
//   for(int j =0; j < 80; j++){
//    sensorValue += analogRead(sensorPin);
//  }
//  
//
//    int val = sensorValue/100;
//    Serial.write(lowByte(val));
//    Serial.write(highByte(val));
// 
//
//   delay(3);

}
