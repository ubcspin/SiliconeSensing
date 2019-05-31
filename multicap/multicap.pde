//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
long temp[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int tempF, tempF2;
int yDist;
int xpos = 0;
Table table;
int c;
long base1, base2 = 0;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM4", 9600);


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
  
  //background(255);
  // while(commPort.available() >0 ){
  xpos++;
  do{
    tempF = readByte();
   //  println( tempF);
  }while(tempF != 222);
   
  for(int i = 0; i < 25; i++){
    temp[i] = readByte();
    println(temp[i]);
  }
 
 //   temp[0] = readByte();
 //fill(255,0,0); 
 //stroke(255, 0, 0);
 //println(temp[0]);
 //rect (xpos, 40+temp[0]/5,2,2);
  //println(temp[0]);
  
 //   temp[1] = readByte();
 //fill(0,0,255); 
 //stroke(0, 0, 255);
 //println(temp[1]);
 //rect (xpos, 40+temp[1]/5,2,2);
 
 //if(temp[1]>temp[0]){
 ////text("LEFT",500, 500);
 //println("LEFT");
 //}else{
 //  //text("RIGHT", 500, 500);
 //  println("RIGHT");
 ////}
 //  if(xpos >= 800){
 //  xpos = 0;
 //  background(255);
 // }
 
 
 for(int i = 0; i < 25; i++){
   if(i <5){ //first row
     fill(temp[i]);
     rect((i%5)*160, 0, 160, 160);
   }
   else if(i <10){ //second row
     fill(temp[i]);
     rect((i%5)*160, 160, 160, 160);
   }
   else if(i <15){ //third row
     fill(temp[i]);
     rect((i%5)*160, 320, 160, 160);
   }
   else if(i < 20){ //fourth row
     fill(temp[i]);
     rect((i%5)*160, 480, 160, 160);
   }   
   else if(i <25){ //fifth row
     fill(temp[i]);
     rect((i%5)*160, 640, 160, 160);
   }
 }
  
}
