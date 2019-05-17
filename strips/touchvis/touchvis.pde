//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
long temp[] = {0,0,0,0,0,0,0,0,0,0};
int tempF;
int yDist;
int xpos = 0;
Table table;
int c;
long base1, base2 = 0;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,1100);
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
  
  background(0,0,0, 254);
 // while(commPort.available() >0 ){
 xpos++;
 c++;
 do{
   tempF = readByte();
  println( tempF);
 }while(tempF != 222);
 
 //************************************************ 1
 temp[0] = readByte();
 //fill(255,0,0); 
 //stroke(255, 0, 0);
 //println(temp[0]);
 //rect (xpos, 40+temp[0]/5,2,2);
 
 if(c%2 == 0){
 //************************************************ 2
 temp[1] = readByte()/2;
 if(c == 1){
   base1 = temp[1];
 }
 //fill(0, 255,0); 
 //stroke(0, 255, 0);
 //println(temp[1]);
 //rect (xpos, 140+temp[1]/5,2,2);
 }else{
 
 //************************************************ 3
 temp[2] = readByte()/2;
 
 if(c == 1){
   base2 = temp[2];
 }
 //fill(0, 0,255); 
 //stroke(0, 0,255);
 //println(temp[2]);
 //rect (xpos, 240+temp[2]/5,2,2);
 }
 
 rect(temp[1] - base1, temp[2] - base2, 5, 5);
 
//  //************************************************ 4
// temp[3] = readByte();
// fill(0, 100,100); 
// stroke(0, 100,100);
// println(temp[3]);
// rect (xpos, 340+temp[3]/5,2,2);
 
////************************************************ 5
// temp[4] = readByte();
// fill(100, 0,100); 
// stroke(100, 0,100);
// println(temp[4]);
// rect (xpos, 440+temp[4]/5,2,2);
 
////************************************************ 6
// temp[5] = readByte();
// fill(100, 100,0); 
// stroke(100, 100,0);
// println(temp[5]);
// rect (xpos, 540+temp[5]/5,2,2);
 
// //************************************************ 7
// temp[6] = readByte();
// fill(200, 0,50); 
// stroke(200, 0, 50);
// println(temp[6]);
// rect (xpos, 640+temp[6]/5,2,2);
 
 
//  //************************************************ 8
// temp[7] = readByte();
// fill(50, 0,200); 
// stroke(50, 0, 200);
// println(temp[7]);
// rect (xpos, 740+temp[7]/5,2,2);
 
 
// //************************************************ 9
// temp[8] = readByte();
// fill(30, 200, 20); 
// stroke(30, 200, 20);
// println(temp[8]);
// rect (xpos, 820+temp[8]/5,2,2);
 
 
//  //************************************************ 10
// temp[9] = readByte();
// fill(10, 10, 200); 
// stroke(10, 10, 200);
// println(temp[9]);
// rect (xpos, 860+temp[9]/5,2,2);
 
// tempF = readByte;
 println("END");
 
 if(xpos >= 800){
   xpos = 0;
   background(255);
  }
 // }
}
