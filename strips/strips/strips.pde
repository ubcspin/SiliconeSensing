//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort, commPort2;
long temp[] = {0,0,0,0,0,0,0,0,0,0};
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
 commPort = new Serial(this, "COM3", 115200);


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
  
  background(0);
 // while(commPort.available() >0 ){
 c++;
 do{
   tempF = readByte();
 // println( tempF);
 }while(tempF != 222);
 
 for(int i = 0; i < 8; i++){
  temp[i] = readByte();
  println(temp[i]);
 }
 println("columns: "+temp[4]+" " + temp[5] + " " + temp[6] + " " + temp[7] );
 
 //************************************** row 1
 if(temp[0] >= 0 && temp[0] != 65534){
 fill(temp[0]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(0,0,800,160);
  fill(255, 0,0);
  text(sqrt(temp[0]), 10, 10);
 
 
 //************************************** row 2
 if(temp[1] >= 0 && temp[1] != 65534){
 fill(temp[1]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(0,160,800,160);
  fill(255, 0,0);
  text(sqrt(temp[1]), 10, 170);
 
 //************************************** row 3
 if(temp[2] >= 0 && temp[2] != 65534){
 fill(temp[2]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(0,320,800,160);
  fill(255, 0,0);
  text(sqrt(temp[2]), 10, 330);
 
 //************************************** row 4 
 if(temp[3] >= 0 && temp[3] != 65534){
 fill(temp[3]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 
 rect(0,480,800,160);
  fill(255, 0,0);
  text(sqrt(temp[3]), 10, 490);
 
 //************************************** row 5 
 //fill(temp[4], 150);
 //rect(0,640,800,160);
 // fill(255, 0,0);
 // text(sqrt(temp[4]), 10, 650);
 //************************************** column 1
 if(temp[4] >= 0 && temp[4] != 65534){
 fill(temp[4]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(0,0,160,800);
  fill(255, 0,0);
  text(sqrt(temp[4]), 10, 10);
 //************************************** column 2 
 if(temp[5] >= 0 && temp[5] != 65534){
 fill(temp[5]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(160,0,160,800);
  fill(255, 0,0);
  text(sqrt(temp[5]), 170, 10);
 //************************************** column 3
 if(temp[6] >= 0 && temp[6] != 65534){
 fill(temp[6]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(320,0,160,800);
  fill(255, 0,0);
  text(sqrt(temp[6]), 330, 10);
 
 //************************************** column 4
 if(temp[7] >= 0 && temp[7] != 65534){
 fill(temp[7]/2, 150);
 }else{
   fill(255, 0, 0);
 }
 rect(480,0,160,800);
  fill(255, 0,0);
  text(sqrt(temp[7]), 490, 10);
 //************************************** column 5
 fill(0, 150);
 rect(640,0,160,800);
  //fill(255, 0,0);
  //text(sqrt(0), 650, 10);
  
 
 //println("END");
 
 //if(xpos >= 800){
 //  xpos = 0;
 //  background(255);
 // }
 // }
}
