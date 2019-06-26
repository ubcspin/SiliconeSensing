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
   do{
   temp = readByte();
  //println( temp);
 }while(temp != 222);
 
  
  background(255);
  temp = readByte();
  fill(temp);
  triangle(300, 300, 500, 300, 400, 400);
 
  temp = readByte();
  fill(temp);
  triangle(300, 300, 300, 500, 400, 400);

  temp = readByte();
  fill(temp);  
  triangle(300, 500, 500, 500, 400, 400);

  temp = readByte();
  fill(temp);
  triangle(500, 300, 500, 500, 400, 400);

}
