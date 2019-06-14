//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
int baseline = 0;
Table table;
int xpos = 800;
int tempF;
int temp[] = {0, 0, 0, 0, 0, 0, 0};

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM4", 9600);
  textSize(20);
  
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
  do{
    tempF = readByte();
  }while(tempF != 222);
  
  
  xpos++;
  fill(0);
  background(255);
  
  for(int i = 0; i< 7; i++){
   temp[i] = readByte(); 
   println(temp[i]);
  }
 
  beginShape();
  //curveVertex(10,  500);
  curveVertex(60,  500 - temp[0]);
  curveVertex(110,  500 - temp[1]);
  curveVertex(160,  500 - temp[2]);
  curveVertex(210,  500 - temp[3]);
  curveVertex(260,  500 - temp[4]);
  curveVertex(310,  500 - temp[5]);
  curveVertex(360,  500 - temp[6]);
  //curveVertex(410,  500);
  endShape();
}
