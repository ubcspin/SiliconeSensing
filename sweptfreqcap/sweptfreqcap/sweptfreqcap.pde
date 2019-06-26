import weka.core.Instance;
import weka.core.Instances;
import weka.core.Attribute;
import weka.core.FastVector;
import weka.classifiers.Classifier;
import weka.classifiers.trees.RandomForest;
import java.io.ObjectInputStream;

//import Serial communication library
import processing.serial.*;
//init variables
Serial commPort;
int baseline = 0;
Table table;
int xpos = 800;
int tempF;
int temp[] = {0, 0, 0, 0, 0, 0, 0};


Classifier cls = null;
Instance inst;
 Instances dataset;

void setup()
{
  
  try {
        cls = (Classifier) weka.core.SerializationHelper.read(dataPath("model.model"));
    } catch (Exception e1) {
        e1.printStackTrace();
    }
 //setup fonts for use throughout the application
//set the size of the window
 size(800,800);
//init serial communication port
 commPort = new Serial(this, "COM4", 9600);
  textSize(20);
 
 table = new Table();
 table.addColumn("0");
 table.addColumn("1");
 table.addColumn("2");
 table.addColumn("3");
 table.addColumn("4");
 table.addColumn("5");
 table.addColumn("6");
 table.addColumn("y");


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


void draw()
{try{
inst = new DenseInstance(7);
  do{
    tempF = readByte();
  }while(tempF != 222);
  
  
  xpos++;
  fill(0);
  background(255);
  
  for(int i = 0; i< 7; i++){
   temp[i] = readByte(); 
   println(temp[i]);
   inst.setValue(i, temp[i]);
  }
  
  dataset.add(inst);
  inst.setDataset(dataset);
  double x = cls.classifyInstance(inst);
   text(""+x+"", 100, 100);
  beginShape();
  //curveVertex(10,  500);
  curveVertex(60,  500 - temp[0]);
  curveVertex(180,  500 - temp[1]);
  curveVertex(300,  500 - temp[2]);
  curveVertex(420,  500 - temp[3]);
  curveVertex(540,  500 - temp[4]);
  curveVertex(660,  500 - temp[5]);
  curveVertex(780,  500 - temp[6]);
  //curveVertex(410,  500);
  endShape();


}catch(Exception e){
  e.printStackTrace();
}

}

void keyPressed(){
    TableRow newRow = table.addRow();
  newRow.setString("0", ""+temp[0]+"");
  newRow.setString("1", ""+temp[1]+"");
  newRow.setString("2", ""+temp[2]+"");
  newRow.setString("3", ""+temp[3]+"");
  newRow.setString("4", ""+temp[4]+"");
  newRow.setString("5", ""+temp[5]+"");
  newRow.setString("6", ""+temp[6]+"");
  newRow.setString("y", ""+key+"");
}
void dispose(){
  saveTable(table, "data/new.csv");
}
