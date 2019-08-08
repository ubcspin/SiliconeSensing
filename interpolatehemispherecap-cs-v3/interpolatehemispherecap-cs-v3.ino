#include <CapacitiveSensor.h>

CapacitiveSensor cs_3_2 = CapacitiveSensor(3,2); 
CapacitiveSensor cs_5_4 = CapacitiveSensor(5,4); 
CapacitiveSensor cs_7_6 = CapacitiveSensor(7,6); 
CapacitiveSensor cs_9_8 = CapacitiveSensor(9,8); 
CapacitiveSensor cs_11_10 = CapacitiveSensor(11,10); 
CapacitiveSensor cs_13_12 = CapacitiveSensor(13,12); 
CapacitiveSensor pins[] = {cs_3_2, cs_5_4, cs_7_6, cs_9_8, cs_11_10, cs_13_12};

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
    return 2;
  }
  if(i == 1){
    return 4;
  }
  if(i == 2){
    return 6;
  }
  if(i == 3){
    return 8;
  }
  if(i == 4){
    return 10;
  }
  if(i == 5){
    return 12;
  }
}
void loop() {

  for(int i = 0; i < 6; i++){
 
//    delay(3);
    int val = 0;
    
    for(int j =0; j < 1; j++){
      val =  pins[i].capacitiveSensor(1, getRP(i));  
    }

//    val = val/1;

  
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
