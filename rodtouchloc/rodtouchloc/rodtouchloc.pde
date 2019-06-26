//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
int xpos = 0;
int temp = 800;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(900,900);
//init serial communication port
 commPort = new Serial(this, "COM7", 9600);
  textSize(20);
  
  noStroke();
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
  xpos++;
  
   do{
   temp = readByte();
  //println( temp);
 }while(temp != 222);
 
  
  fill(255, 0, 0);
  //background(255);
  temp = readByte();
  //println(temp);

   rect (xpos, 200+temp,2,2);
 
  fill(0,255,0);
  //background(255);
  temp = readByte();
  //println(temp);

  rect (xpos, 200+temp,2,2);
 
   fill(0,0,255);
  //background(255);
  temp = readByte();
  //println(temp);

  rect (xpos, 200+temp,2,2);
  
  fill(0);
  //background(255);
  temp = readByte();
  //println(temp);
  
  rect (xpos, 200+temp,2,2);
 
  fill(200,0,200);
  //background(255);
  temp = readByte();
  println(temp);
  
  rect (xpos, 200+temp,2,2);
 
  
  if(xpos >= 800){
   xpos = 0;
   background(255);
  }
}
