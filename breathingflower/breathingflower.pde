import processing.serial.*;
//init variables
Serial commPort;

int tempF;
int temp[] = {0, 0, 0, 0, 0, 0, 0};

void setup(){
  
  size(800, 800);
  
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

void draw(){
  
   do{
    tempF = readByte();
      println(tempF);
  }while(tempF != 222);
  
  
  background(255);
  for(int i = 0; i < 7; i++){
   temp[i] = readByte(); 
   println(temp[i]);
  }
  
    text(temp[5]+"", 300, 600);
  fill(temp[5]*2);
  ellipse(400, 225, 350, 350);
  
  fill(temp[0]);
  ellipse(400,100, 100, 100);
  fill(temp[1]);
  ellipse(300,200, 100, 100);  
  fill(temp[2]);
  ellipse(335,320, 100, 100);
  fill(temp[3]);
  ellipse(465,320, 100, 100);
  fill(temp[4]);
  ellipse(500,200, 100, 100);
  

  
}
