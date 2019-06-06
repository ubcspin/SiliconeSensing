//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
int numreadings = 36;
int delimiter = 222;
int numcolumns = 3;
int nummeasures = 4;
int numrows = numreadings/(nummeasures*numcolumns);
final int screensize = 800;
int windowsize = screensize/numcolumns;
int cellsize = windowsize/2;

long temp[] = new long[numreadings];
long last[] = new long[numreadings];
int yDist;
int xpos = 0;
Table table;
int c;
long tempDelim;
void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(900,900);
//init serial communication port
 commPort = new Serial(this, "COM7", 9600);

  do{
    tempDelim = readByte();
   //  println( tempDelim);
  }while(tempDelim != delimiter);
   
  for(int i = 0; i < numreadings; i++){
    last[i] = readByte();
    println(last[i]);
  }

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
  // while(commPort.available() >0 ){
  xpos++;
  do{
    tempDelim = readByte();
   //  println( tempDelim);
   if(tempDelim > 1000){
     
   commPort = new Serial(this, "COM7", 9600);
    //commPort.read();
   }
  }while(tempDelim != delimiter);
   
  for(int i = 0; i < numreadings; i++){
    //temp[i] = readByte();
    temp[i] = 3*abs(int(last[i] - readByte()));
 //   println(temp[i]);
  }

 /////////////////////////////////////////////////
 int cellcolumns = 2;
 int cellrows = 2;
 int cellcounter = 0;
  
 for(int j = 0; j < numrows; j++){ //for each row
   for(int i = 0; i<numcolumns; i++){ //////////for each column
     for(int h = 0; h < nummeasures/cellrows; h++){
       for(int k = 0; k < nummeasures/cellcolumns; k++){
         fill(temp[cellcounter]/3);
         rect(k*cellsize+i*windowsize, h*cellsize+j*windowsize, cellsize, cellsize);
         cellcounter++;
       }
     }
   }
 }
 
 
 /////////////////////////////////////////////////
 //for(int i = 0; i < numreadings/nummeasures; i++){
 //  if(i <numreadings/numcolumns){ //first row
 //    if(i%nummeasures==0) //top left corner
 //    {
 //      fill(temp[i]/numcolumns);
 //      rect(((i/4)%nummeasures)*windowsize, 0, cellsize, cellsize);
 //    }
 //    else if(i%nummeasures==1) //top right corner
 //    {
 //      fill(temp[i]/numcolumns);
 //      rect(((i/4)%nummeasures)*windowsize + cellsize, 0, cellsize, cellsize);
 //    }
 //    else if(i%nummeasures==2) //bottom left corner
 //    {
 //      fill(temp[i]/numcolumns);
 //      rect(((i/4)%nummeasures)*windowsize, cellsize, cellsize, cellsize);
 //    }
 //    else if(i%nummeasures==3) //bottom right corner
 //    {
 //      fill(temp[i]/numcolumns);
 //      rect(((i/4)%nummeasures)*windowsize + cellsize, cellsize, cellsize, cellsize);
 //    }
     
     
 //  }
 //  else if(i < (numreadings/numcolumns)*2){ //second row
 //    if(i%4==0) //top left corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize, windowsize, cellsize, cellsize);
 //    }
 //    else if(i%4==1) //top right corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize + cellsize, windowsize, cellsize, cellsize);
 //    }
 //    else if(i%4==2) //bottom left corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize, 240, cellsize, cellsize);
 //    }
 //    else if(i%4==3) //bottom right corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize + cellsize, 240, cellsize, cellsize);
 //    }
 //  }
 //  else if(i < (numreadings/numcolumns)*3){ //third row
 //    if(i%4==0) //top left corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize, windowsize*2, cellsize, cellsize);
 //    }
 //    else if(i%4==1) //top right corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize + cellsize, windowsize*2, cellsize, cellsize);
 //    }
 //    else if(i%4==2) //bottom left corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/3)%nummeasures)*windowsize, 400, cellsize, cellsize);
 //    }
 //    else if(i%4==3) //bottom right corner
 //    {
 //      fill(temp[i]/3);
 //      rect(((i/4)%nummeasures)*windowsize + cellsize, 400, cellsize, cellsize);
 //    }
 //  }
  
 //}
 
  noFill();
  stroke(255, 0, 0);
  rect(0, 0, windowsize, windowsize);
  rect(windowsize, 0, windowsize, windowsize);
  rect(windowsize*2, 0, windowsize, windowsize);
  
  rect(0, windowsize, windowsize, windowsize);
  rect(windowsize, windowsize, windowsize, windowsize);
  rect(windowsize*2, windowsize, windowsize, windowsize);
  
  
  rect(0, windowsize*2, windowsize, windowsize);
  rect(windowsize, windowsize*2, windowsize, windowsize);
  rect(windowsize*2, windowsize*2, windowsize, windowsize);
  
  noStroke();
}
