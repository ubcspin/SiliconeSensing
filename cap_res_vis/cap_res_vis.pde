//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
long temp[] = {0,0,0,0,0,0,0,0,0,0};
long cap;
int tempF;
int yDist;
int xpos = 0;
Table table;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,1100);
//init serial communication port
 commPort = new Serial(this, "COM7", 9600);

 table = new Table();
 table.addColumn("resistance");
 table.addColumn("cap");
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
  println( tempF);
 }while(tempF != 222);
 
 //************************************************ 1
 temp[0] = readByte();
 fill(255,0,0); 
 stroke(255, 0, 0);
 //println(temp[0]);
 rect (xpos, 40+temp[0] ,2,2);

 //************************************************* capacitive
 
 cap = readByte();
 fill(0); 
 stroke(0);
 //println(cap);
 rect (xpos, 440+cap/5,2,2);
 
 
// tempF = readByte;
 println("END");
 
 if(xpos >= 800){
   xpos = 0;
   background(255);
  }
 // }
}
