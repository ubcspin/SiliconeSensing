//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort, commPort2;
long temp[] = {0,0,0,0,0,0,0,0,0,0};
int tempF, tempF2;
int yDist;
int xpos = 0;
Table table;
int c;
long base1, base2 = 0;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM3", 115200);


}

int readByte(){
  int vala, valb, valc, vald = 0;
  
  while(commPort.available() <= 1){
   // println("loading");
   delay(1);
  }
  vala = commPort.read();
  valb = commPort.read();
  valc = valb << 8;
  vala = vala | valc;
  vald = valb >> 8;
  vala = vala | vald;
  vala = vala & 0xffff;
  return vala;
}

void draw()
{
  
  background(0);
  // while(commPort.available() >0 ){
  c++;
  do{
    tempF = readByte();
    // println( tempF);
  }while(tempF != 222);
   
  for(int i = 0; i < 8; i++){
    temp[i] = readByte();
    //println(temp[i]);
  }
  println("columns: "+temp[4]+" " + temp[5] + " " + temp[6] + " " + temp[7] );
  
 //****************************************rows
 for(int j = 0; j<4; j++){
   
   if(temp[j] >= 0 && temp[j] != 65534){
     fill(temp[j]/2, 150);
   }else{
     fill(255, 0, 0);
   }
   rect(0,j*160, 800, 160);
   fill(255, 0,0);
   text(sqrt(temp[j]), 10, 10+j*160);
 }
 
  //****************************************columns
 for(int j = 4; j<8; j++){
   
   if(temp[j] >= 0 && temp[j] != 65534){
     fill(temp[j]/2, 150);
   }else{
     fill(255, 0, 0);
   }
   rect((j-4)*160,0, 160, 800);
   fill(255,0,0);
   text(sqrt(temp[j]), 10+(j-4)*160, 10);
 }


 //************************************** column 5
 fill(0, 150);
 rect(640,0,160,800);
  //fill(255, 0,0);
  //text(sqrt(0), 650, 10);
  
 
 //println("END");

}
