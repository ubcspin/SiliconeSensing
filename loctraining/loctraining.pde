//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
long temp[] = {0,0,0,0};
int tempF;
int yDist;
int xpos = 0;
Table table;

void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM4", 9600);

 table = new Table();
 table.addColumn("tl");
 table.addColumn("bl");
 table.addColumn("tl2");
 table.addColumn("tr");
 table.addColumn("tr2");
 table.addColumn("br");
 table.addColumn("bl2");
 table.addColumn("br2");
 table.addColumn("x");
 table.addColumn("y");
 
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
 while(commPort.available() < 8 ){
   delay(1);
 }
 
 int tl, bl, tl2, tr, tr2, br, bl2, br2 = 0;
 
 tl = commPort.read();
 bl = commPort.read();
 tl2 = commPort.read();
 tr = commPort.read();
 tr2 = commPort.read();
 br = commPort.read();
 bl2 = commPort.read();
 br2 = commPort.read();
 
 
 if(mousePressed){
   
  TableRow newRow = table.addRow();
  newRow.setString("tl", ""+tl+"");
  newRow.setString("bl", ""+bl+"");
  newRow.setString("tl2", ""+tl2+"");
  newRow.setString("tr", ""+tr+"");
  newRow.setString("tr2", ""+tr2+"");
  newRow.setString("br", ""+br+"");
  newRow.setString("bl2", ""+bl2+"");
  newRow.setString("br2", ""+br2+"");
 }
}

void stop(){
  saveTable(table, "data/new.csv");
}
