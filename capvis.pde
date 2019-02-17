//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
long temp = 0;
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

// table = new Table();
// table.addColumn("0");
// table.addColumn("1");
// table.addColumn("2");
// table.addColumn("3");
// table.addColumn("4");
// table.addColumn("5");
// table.addColumn("6");
// table.addColumn("7"); 
// table.addColumn("8");
// table.addColumn("9");
// table.addColumn("label");
 
}

int readByte(){
  int vala, valb, valc, vald = 0;
  
  while(commPort.available() <= 1){
   // println("loading");
   delay(1);
  }
  vala = commPort.read();  
  vala = vala & 0x00ff;
  valb = commPort.read();
  valb = valb & 0x00ff;
  valc = valb << 8;
  vala = valc | vala;
  //vald = valb >> 8;
  //vala = vala | vald;
 // vala = vala & 0xffff;
  return vala/4;
}

void draw()
{
  
 // background(0,0,0, 254);
  while(commPort.available() >0 ){
 xpos++;
 //do{
 //  tempF[0] = readByte();   
 //  tempF[1] = readByte();
 //  tempF[2] = readByte();
 //  tempF[3] = readByte();
 // println( tempF);
 //}while(tempF[0] != 222 || tempF[1] != 222 || tempF[2] != 222 || tempF[3] != 222);
 
 //************************************************ 1
 temp = readByte();
 fill(255,0,0); 
 stroke(255, 0, 0);
 println(temp);
 float y = 240+temp;
 rect (xpos, y,2,2);

// println(str(keyPressed));
 if(xpos >= 800){
   xpos = 0;
   background(255);
  }
  }
}
