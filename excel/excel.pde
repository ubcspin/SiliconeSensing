//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;

int xpos = 800;
int tempF;
int temp[] = {0, 0, 0, 0, 0, 
              0, 0, 0, 0, 0, 
              0, 0, 0, 0, 0, 
              0, 0, 0, 0, 0, 
              };
Table table;
void setup()
{
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM7", 9600);
 noStroke();
 
 table = new Table();
 table.addColumn("0");
 table.addColumn("1");
 table.addColumn("2");
 table.addColumn("3");
 table.addColumn("4");
 table.addColumn("5");
 table.addColumn("6"); 
 table.addColumn("9");
 table.addColumn("10");
 table.addColumn("11");
 table.addColumn("12");
 table.addColumn("13");
 table.addColumn("14");
 table.addColumn("15");
 table.addColumn("16");
 table.addColumn("17");
 table.addColumn("18");
 table.addColumn("19");

}

int readByte(){
  int vala, valb, valc, vald = 0;
  
  while(commPort.available() <= 1){
   //println("loading");
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

float interpolate(int before, int after, float pos){
  pos = pos/10;
  float x =0;
  x = pos*after+(1-pos)*before;
  return map(x*2, 0, 1023, 0, 255);
}
void draw()
{
  //background(255);
  do{
    tempF = readByte();
      //println(tempF);
  }while(tempF != 222);
  TableRow newRow = table.addRow();
  
  for(int i = 0; i < 20; i++){
   temp[i] = readByte(); 
   newRow.setString(""+i, ""+temp[i]);
   
  }
  
  
  println(temp[0]);
  //background(temp[0]);

}


void dispose(){
  saveTable(table, "data/tt.csv");
}
