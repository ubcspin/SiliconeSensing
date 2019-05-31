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
 table.addColumn("rt-rb");
 table.addColumn("rb-br");
 table.addColumn("br-bl");
 table.addColumn("bl-lb");
 table.addColumn("lb-lt");
 table.addColumn("rb-br2");
 table.addColumn("br-bl2");
 table.addColumn("bl-lb2");
 table.addColumn("lb-lt2");
 table.addColumn("lt-tl");
 table.addColumn("br-bl3");
 table.addColumn("bl-lb3");
 table.addColumn("lb-lt3");
 table.addColumn("lt-tl2");
 table.addColumn("tl-tr");
 table.addColumn("bl-lb4");
 table.addColumn("lb-lt4");
 table.addColumn("lt-tl3");
 table.addColumn("tl-tr2");
 table.addColumn("tr-rt");
 table.addColumn("lb-lt5");
 table.addColumn("lt-tl4");
 table.addColumn("tl-tr3");
 table.addColumn("tr-tr2");
 table.addColumn("rt-rb2");
 table.addColumn("lt-lt5");
 table.addColumn("tl-tr4");
 table.addColumn("tr-tr3");
 table.addColumn("rt-rb3");
 table.addColumn("rb-br3");
 table.addColumn("tl-tr5");
 table.addColumn("tr-rt4");
 table.addColumn("rt-rb4");
 table.addColumn("rb-br4");
 table.addColumn("br-bl4");
 table.addColumn("tr-rt5");
 table.addColumn("rt-rb6");
 table.addColumn("rb-br5");
 table.addColumn("br-bl5");
 table.addColumn("bl-lb5");
 
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
