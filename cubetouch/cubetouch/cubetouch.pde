//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(900,900);
//init serial communication port
 commPort = new Serial(this, "COM4", 9600);
fill(0);
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
  
  background(255);
  int val = readByte();
  println(val);
  if(val > 100){
   text("Touch", 300, 300);
  }else{
   text("No touch", 300, 300); 
  }
}
