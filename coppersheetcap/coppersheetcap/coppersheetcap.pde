//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;

int xpos = 800;
int tempF;
int temp[] = {0, 0, 0, 0,0, 0, 0, 0,0, 0, 0, 0,0, 0, 0, 0};

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM7", 9600);

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
  do{
    tempF = readByte();
      println(tempF);
  }while(tempF != 222);
  
  //for(int i = 0; i < 6; i++){
  // temp[i] = readByte(); 
  //}
  
  for (int i = 0; i < 16; i++) {
    temp[i] = readByte();
    if(i%4==3)
    println(temp[i]);
    fill(map(temp[i], 0, 1023, 0, 255));
    rect((i%4)*50,floor(i/4)*50,50,50);
  }

}
