//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
long temp[] = {0,0,0,0};
int tempF;
int yDist;
int xpos = 0;
Table table;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM7", 9600);

 table = new Table();
 table.addColumn("value");
 table.addColumn("label");
 
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
  
 // background(0,0,0, 254);
 // while(commPort.available() >0 ){
 xpos++;
 do{
   tempF = readByte();
//  println( tempF);
 }while(tempF != 222);
 
 tempF = readByte();
 tempF = readByte();
 tempF = readByte();
 
 //************************************************ 1 top left
 temp[0] = readByte();
 fill(map(temp[0], 0, 1024, 0, 255),0,0); 
// stroke(255, 0, 0);
 println(temp[0]);
 rect (0, 0,400,400);
 //************************************************ 2 bottom left
 temp[1] = readByte();
 fill(map(temp[1], 0, 1024, 0, 255),0,0); 
// stroke(255, 0, 0);
 println(temp[1]);
 rect (0, 400,400,400);
 
 //************************************************ 3 bottom right
 temp[2] = readByte();
 fill(map(temp[2], 0, 1024, 0, 255),0,0); 
// stroke(255, 0, 0);
 println(temp[2]);
 rect (400, 400,400,400);
 
  //************************************************ 4 top right
 temp[3] = readByte();
 fill(map(temp[3], 0, 1024, 0, 255),0,0); 
// stroke(255, 0, 0);
 println(temp[3]);
 rect (400, 0,400,400);
 
// tempF = readByte;
 println("END");
 
 //if(xpos >= 800){
 //  xpos = 0;
 //  background(255);
 // }
 // }
}
