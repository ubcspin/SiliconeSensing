#include <CapacitiveSensor.h>

CapacitiveSensor cs_3_A0 = CapacitiveSensor(3,A0); 
CapacitiveSensor cs_5_A1 = CapacitiveSensor(5,A1); 
CapacitiveSensor cs_7_A2 = CapacitiveSensor(7,A2); 
CapacitiveSensor cs_9_A3 = CapacitiveSensor(9,A3); 
CapacitiveSensor cs_11_A4 = CapacitiveSensor(11,A4); 
CapacitiveSensor cs_13_A5 = CapacitiveSensor(13,A5); 
CapacitiveSensor pins[] = {cs_3_A0, cs_5_A1, cs_7_A2, cs_9_A3, cs_11_A4, cs_13_A5};

int buff[] = {0, 0, 0, 0, 0, 0, 222};
int cal[] = {0,0,0,0,0,0, 0};
int recalibrate = 99;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
//   for(int i =0; i < 6; i++){
//      pins[i].set_CS_AutocaL_Millis(0xFFFFFFFF);
//   }
  
}

int getSP(int i){
  if(i == 0){
    return 3;
  }
  if(i == 1){
    return 5;
  }
  if(i == 2){
    return 7;
  }
  if(i == 3){
    return 9;
  }
  if(i == 4){
    return 11;
  }
  if(i == 5){
    return 13;
  }
}

int getRP(int i){
  if(i == 0){
    return A0;
  }
  if(i == 1){
    return A1;
  }
  if(i == 2){
    return A2;
  }
  if(i == 3){
    return A3;
  }
  if(i == 4){
    return A4;
  }
  if(i == 5){
    return A5;
  }
}
void loop() {

  for(int i = 0; i < 1; i++){
 
//    delay(3);
    int val = 0;
    
//    for(int j =0; j < 1; j++){
 //     val =  pins[i].capacitiveSensor(60);  
//    }

//    val = val/1;


digitalWrite(getSP(i), LOW);
pinMode(getRP(i), OUTPUT);
digitalWrite(getRP(i), LOW);
delayMicroseconds(100);
pinMode(getSP(i), OUTPUT);
pinMode(getRP(i), INPUT);
digitalWrite(getSP(i), HIGH);

delayMicroseconds(800);
val = analogRead(getRP(i));

digitalWrite(getRP(i), HIGH);
pinMode(getRP(i), OUTPUT);
digitalWrite(getRP(i), HIGH);
pinMode(getRP(i), INPUT);
pinMode(getSP(i), INPUT);
  
    buff[i] = val;
  //  turnAllOff();
    
  }

for(int i = 0; i < 7; i++){

  int send = abs(buff[i]);
  Serial.write(lowByte(send));
  Serial.write(highByte(send ));


}
recalibrate++;

  if(recalibrate >= 100){
    for(int j = 0; j < 6; j++){
      cal[j] = buff[j];
    }
    recalibrate=0;
  }
}
