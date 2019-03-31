import weka.core.Instance;
import weka.core.Instances;
import weka.core.Attribute;
import weka.core.FastVector;
import weka.classifiers.Classifier;
import weka.classifiers.trees.RandomForest;
import java.io.ObjectInputStream;
import processing.serial.*;
//init variables
Serial commPort;
long press;
long cap;
int tempF;

float vertexpos = 0;
float zpos = 100;
float xpos = 0;
int state = 0;
Classifier cls = null;
Instance inst;
 Instances dataset;
void setup(){
    try {
        cls = (Classifier) weka.core.SerializationHelper.read(dataPath("randomforest.model"));
    } catch (Exception e1) {
        e1.printStackTrace();
    }
    
     size(800,800, P3D);
  //init serial communication port
   commPort = new Serial(this, "COM7", 9600);
    weka.core.Attribute r0 = new weka.core.Attribute("r0");
    weka.core.Attribute c0 = new weka.core.Attribute("c0");
    weka.core.Attribute r1 = new weka.core.Attribute("r1");
    weka.core.Attribute c1 = new weka.core.Attribute("c1");    
    weka.core.Attribute r2 = new weka.core.Attribute("r2");
    weka.core.Attribute c2 = new weka.core.Attribute("c2");    
    weka.core.Attribute r3 = new weka.core.Attribute("r3");
    weka.core.Attribute c3 = new weka.core.Attribute("c3");    
    weka.core.Attribute r4 = new weka.core.Attribute("r4");
    weka.core.Attribute c4 = new weka.core.Attribute("c4");    
    weka.core.Attribute r5 = new weka.core.Attribute("r5");
    weka.core.Attribute c5 = new weka.core.Attribute("c5");    
    weka.core.Attribute r6 = new weka.core.Attribute("r6");
    weka.core.Attribute c6 = new weka.core.Attribute("c6");    
    weka.core.Attribute r7 = new weka.core.Attribute("r7");
    weka.core.Attribute c7 = new weka.core.Attribute("c7");    
    weka.core.Attribute r8 = new weka.core.Attribute("r8");
    weka.core.Attribute c8 = new weka.core.Attribute("c8");    
    weka.core.Attribute r9 = new weka.core.Attribute("r9");
    weka.core.Attribute c9 = new weka.core.Attribute("c9");
  
    FastVector labels = new FastVector();
    labels.addElement("n");
    labels.addElement("t");
    labels.addElement("l");
    labels.addElement("m");
    labels.addElement("h");
    weka.core.Attribute cls = new weka.core.Attribute("label", labels);
    FastVector attributes = new FastVector();
    attributes.addElement(r0);
    attributes.addElement(c0);
    attributes.addElement(r1);
    attributes.addElement(c1);
    attributes.addElement(r2);
    attributes.addElement(c2);
    attributes.addElement(r3);
    attributes.addElement(c3);
    attributes.addElement(r4);
    attributes.addElement(c4);
    attributes.addElement(r5);
    attributes.addElement(c5);
    attributes.addElement(r6);
    attributes.addElement(c6);
    attributes.addElement(r7);
    attributes.addElement(c7);
    attributes.addElement(r8);
    attributes.addElement(c8);
    attributes.addElement(r9);
    attributes.addElement(c9);
    attributes.addElement(cls);
    dataset = new Instances("TestInstances", attributes, 0);
    
    dataset.setClassIndex(20);
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
  background(255);

  //println("gkufkujv");
  try{
inst = new DenseInstance(21);
for(int i = 0; i<20; i+=2){
   do{
     tempF = readByte();
    //println( tempF);
   }while(tempF != 222);
   
   //************************************************ 1
   press = readByte();
   inst.setValue(i, press);
  
   //************************************************* capacitive
   
   cap = readByte();
   inst.setValue(i+1, cap);
   
   if(state >1 && state <1000){
     zpos = -cap;
   }
   //vertexpos=100-(press-230)*2;
 //vertexpos = -cap;
 //
    if(state > 1001 && state <2000){
     xpos = - cap/2;
    }
    
   
  // tempF = readByte;
 //  println("END");
 }
 
 dataset.add(inst);
 inst.setDataset(dataset);
double x = cls.classifyInstance(inst);
fill(0);

if(state == 1050 || state == 50){
state = 0;
}
if(x == 0.0) {
  text("no touch", 400,400);
  state-=50;
}
else if(x == 1.0) {
  text("one finger", 400,400);
  state = 1000;
}
else if(x == 2.0) {
  text("three fingers", 400,400);
  state = 2000;
}
//println(x);
  }
  catch (Exception e){
    e.printStackTrace();
  }
  
  translate(width/2, height/2, 0);
stroke(0);
rotateX(PI/2);
//rotateZ(-PI/6);
noFill();

beginShape();
vertex(-100, -100, -100);
vertex( 100, -100, -100);
vertex(   xpos,    vertexpos,  zpos);

vertex( 100, -100, -100);
vertex( 100,  100, -100);
vertex(   xpos,    vertexpos,  zpos);

vertex( 100, 100, -100);
vertex(-100, 100, -100);
vertex(   xpos,   vertexpos,  zpos);

vertex(-100,  100, -100);
vertex(-100, -100, -100);
vertex(   xpos,    vertexpos,  zpos);
endShape();
}
