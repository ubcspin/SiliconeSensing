/*
  Analog Input

  Demonstrates analog input by reading an analog sensor on analog pin 0 and
  turning on and off a light emitting diode(LED) connected to digital pin 13.
  The amount of time the LED will be on and off depends on the value obtained
  by analogRead().

  The circuit:
  - potentiometer
    center pin of the potentiometer to the analog input 0
    one side pin (either one) to ground
    the other side pin to +5V
  - LED
    anode (long leg) attached to digital output 13
    cathode (short leg) attached to ground

  - Note: because most Arduinos have a built-in LED attached to pin 13 on the
    board, the LED is optional.

  created by David Cuartielles
  modified 30 Aug 2011
  By Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/AnalogInput
*/

int sensorPin = A0;    // select the input pin for the potentiometer
int ledPin = 13;      // select the pin for the LED
long sensorValue[10] = {0,0,0,0,0,0,0,0,0,0};  // variable to store the value coming from the sensor
int freqs[10] = {0, 1, 3, 7, 15, 31, 63, 127, 255, 0};
void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);
  pinMode(3, OUTPUT);  
  pinMode(11, OUTPUT);
  pinMode(5, OUTPUT);
  Serial.begin(9600);
}

void loop() {
   
  // read the value from the sensor:


 // pinMode(11, OUTPUT);
  TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(WGM22) | _BV(CS20);
  OCR2B = 50;
  digitalWrite(5, HIGH);
  for(int i = 0; i < 10; i++){
    
    sensorValue[i] = 0;
  }
  for(int i = 0; i < 10; i++){
    OCR2A = freqs[i];
    delay(1);
    if(i == 5)
  digitalWrite(5, LOW);
   for(int j =0; j < 100; j++){
    sensorValue[i] += analogRead(sensorPin);
  }
  }

  for (int i = 0; i < 10; i++){
    int val = sensorValue[i]/100;
    Serial.write(lowByte(val));
    Serial.write(highByte(val));
  }
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  
  Serial.write(lowByte(222));
  Serial.write(highByte(222));

  
  Serial.write(lowByte(222));
  Serial.write(highByte(222));

  
  Serial.write(lowByte(222));
  Serial.write(highByte(222));
  // turn the ledPin on
 // digitalWrite(ledPin, HIGH);
  // stop the program for <sensorValue> milliseconds:
 // delay(sensorValue);
  // turn the ledPin off:
//  digitalWrite(ledPin, LOW);
  // stop the program for for <sensorValue> milliseconds:
//  delay(sensorValue);
}
