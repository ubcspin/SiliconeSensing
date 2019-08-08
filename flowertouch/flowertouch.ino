#include <CapacitiveSensor.h>

CapacitiveSensor cs_3_2 = CapacitiveSensor(3,2); 
CapacitiveSensor cs_5_4 = CapacitiveSensor(5,4); 
CapacitiveSensor cs_7_6 = CapacitiveSensor(7,6); 
CapacitiveSensor cs_9_8 = CapacitiveSensor(9,8); 
CapacitiveSensor cs_11_10 = CapacitiveSensor(11,10); 

void setup() {
  // declare the ledPin as an OUTPUT:
//  pinMode(ledPin, OUTPUT);
//  pinMode(11, OUTPUT); // power

  Serial.begin(9600);

}

void loop() {

  int val = cs_3_2.capacitiveSensor(30);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(3);
  val = cs_5_4.capacitiveSensor(30);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));

  delay(3);
  val = cs_7_6.capacitiveSensor(30);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);
  
  val = cs_9_8.capacitiveSensor(30);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);
  val = cs_11_10.capacitiveSensor(30);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);

    val = analogRead(A0);
  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(3);
    
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  delay(3);
  
}
