
int sensorPin = A0;    // select the input pin for the potentiometer
long sensorValue = 0;  // variable to store the value coming from the sensor

//FREQUENCIES 16 MHz / 64 / ( x +1) / 2
// 500 Hz, 1000, 1500, 2000, 2500, 3000, 3500
int freqs[] = {250, 125, 83,62, 50, 41, 35};

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
     Serial.write(lowByte(222));
  Serial.write(highByte(222));
  pinMode(11, OUTPUT);
  pinMode(7, OUTPUT);

  for(int i = 0; i < 7; i ++){
    TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
    TCCR2B = _BV(WGM22) | _BV(CS20);
    OCR2B = 50;    
    OCR2A = freqs[i];
    digitalWrite(7, LOW);
  
  //  digitalWrite(5, HIGH);
  //  for(int i = 0; i < 10; i++){
      sensorValue = 0;
  //  }
  
  
     for(int j =0; j < 100; j++){
      sensorValue += analogRead(sensorPin);
    }
    
  
      int val = sensorValue/100;
      Serial.write(lowByte(val));
      Serial.write(highByte(val));
   
  
  
    delay(3); // arbitrary delay to limit data to serial port

  }

}
