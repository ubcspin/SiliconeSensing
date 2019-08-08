//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
int xpos = 800;
int temp[] = {0,0,0,0,0};
int tempF;

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
  
  do{
    tempF = readByte();
      //println(tempF);
  }while(tempF != 222);
  
  xpos++;
  fill(0);
  //background(255);
  
  
  for(int i = 0; i<5; i++){
    stroke(i*50, 0,0);
  temp[i] = readByte();
  rect (xpos, (i*100)+temp[i],2,2);
  }
  println(temp);

 
  if(xpos >= 800){
   xpos = 0;
   background(255);
  }
}
