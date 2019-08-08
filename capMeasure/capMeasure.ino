#include <CapacitiveSensor.h>

CapacitiveSensor cs_4_2 = CapacitiveSensor(4,2); // 10 megohm resistor between pins 4 & 2, pin 2 is sensor pin, add wire, foil
void setup() {
  // declare the ledPin as an OUTPUT:
  Serial.begin(9600);

}

void loop() {
  long val = 0;
  val = cs_4_2.capacitiveSensor(30);

  Serial.write(lowByte(val));
  Serial.write(highByte(val));
  delay(20);
  
}
