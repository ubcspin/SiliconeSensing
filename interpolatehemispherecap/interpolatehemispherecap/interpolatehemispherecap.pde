//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;

int xpos = 800;
int tempF;
int temp[] = {0, 0, 0, 0, 0, 0};

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

float interpolate(int before, int after, float pos){
  pos = pos/10;
  float x =0;
  x = pos*after+(1-pos)*before;
  return map(x, 0, 1023, 0, 255);
}
void draw()
{
  background(255);
  do{
    tempF = readByte();
      //println(tempF);
  }while(tempF != 222);
  
  //for(int i = 0; i < 6; i++){
  // temp[i] = readByte(); 
  //}
  
  for (int i = 0; i < 6; i++) {
    temp[i] = readByte();
    //print(temp[i] + " ");
    //fill(map(temp[i], 0, 1023, 0, 255));
    //arc(width/2, height/2, 500, 500, radians(60)*i, radians(60)*(i+1));
  }
  
 for (int i = 0; i < 6; i++) {
   // temp[i] = readByte();
    //print(temp[i] + " ");
    int j = i *10;
    println(i);
    if(i == 5){
      
      fill(map(temp[i], 0, 1023, 0, 255));
      arc(width/2, height/2, 500, 500, radians(6)*j, radians(6)*(j+1));
      fill(interpolate(temp[i], temp[0], 1));
      arc(width/2, height/2, 500, 500, radians(6)*(j+1), radians(6)*(j+2));
      fill(interpolate(temp[i], temp[0], 2));
      arc(width/2, height/2, 500, 500, radians(6)*(j+2), radians(6)*(j+3));
      fill(interpolate(temp[i], temp[0], 3));
      arc(width/2, height/2, 500, 500, radians(6)*(j+3), radians(6)*(j+4));
      fill(interpolate(temp[i], temp[0], 4));
      arc(width/2, height/2, 500, 500, radians(6)*(j+4), radians(6)*(j+5)); 
      fill(interpolate(temp[i], temp[0], 5));
      arc(width/2, height/2, 500, 500, radians(6)*(j+5), radians(6)*(j+6));
      fill(interpolate(temp[i], temp[0], 6));
      arc(width/2, height/2, 500, 500, radians(6)*(j+6), radians(6)*(j+7));
      fill(interpolate(temp[i], temp[0], 7));
      arc(width/2, height/2, 500, 500, radians(6)*(j+7), radians(6)*(j+8));
      fill(interpolate(temp[i], temp[0], 8));
      arc(width/2, height/2, 500, 500, radians(6)*(j+8), radians(6)*(j+9));
      fill(interpolate(temp[i], temp[0], 9));
      arc(width/2, height/2, 500, 500, radians(6)*(j+9), radians(6)*(j+10));
    }else{
      fill(map(temp[i], 0, 1023, 0, 255));
      arc(width/2, height/2, 500, 500, radians(6)*j, radians(6)*(j+1));
      fill(interpolate(temp[i], temp[i+1], 1));
      arc(width/2, height/2, 500, 500, radians(6)*(j+1), radians(6)*(j+2));
      fill(interpolate(temp[i], temp[i+1], 2));
      arc(width/2, height/2, 500, 500, radians(6)*(j+2), radians(6)*(j+3));
      fill(interpolate(temp[i], temp[i+1], 3));
      arc(width/2, height/2, 500, 500, radians(6)*(j+3), radians(6)*(j+4));
      fill(interpolate(temp[i], temp[i+1], 4));
      arc(width/2, height/2, 500, 500, radians(6)*(j+4), radians(6)*(j+5)); 
      fill(interpolate(temp[i], temp[i+1], 5));
      arc(width/2, height/2, 500, 500, radians(6)*(j+5), radians(6)*(j+6));
      fill(interpolate(temp[i], temp[i+1], 6));
      arc(width/2, height/2, 500, 500, radians(6)*(j+6), radians(6)*(j+7));
      fill(interpolate(temp[i], temp[i+1], 7));
      arc(width/2, height/2, 500, 500, radians(6)*(j+7), radians(6)*(j+8));
      fill(interpolate(temp[i], temp[i+1], 8));
      arc(width/2, height/2, 500, 500, radians(6)*(j+8), radians(6)*(j+9));
      fill(interpolate(temp[i], temp[i+1], 9));
      arc(width/2, height/2, 500, 500, radians(6)*(j+9), radians(6)*(j+10));
    ////i /= 10;
    
    }
  }

}
