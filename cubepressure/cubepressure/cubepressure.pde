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
  fill(0);
  background(255);
  println(readByte());
  if(readByte() > 100){
    text("TOUCH", 300, 300);
  }else{
    text("NO TOUCH", 300, 300);
  }
}
