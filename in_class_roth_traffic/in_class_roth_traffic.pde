
//roth_arduino traffic-light
import processing.serial.*;

Serial myPort;

int portIndex =0;
short LF =10;

class struct_outputs
{
  int A_red_light;
  int A_yellow_light;
  int A_green_light;
  int A_walk_light;
  int B_red_light;
  int B_yellow_light;
  int B_green_light;
  int B_walk_light;
  };
  
 class struct_inputs
  {
   int reset;
   int Sta;
   int Stb;
    
  };
  struct_outputs my_outputs;
  

void setup(){
  
  size(700,700);
  printArray(Serial.list());
  println("Connecting to ->" + Serial.list()[portIndex]);
  myPort = new Serial(this,Serial.list()[portIndex],115200);
  
  
  fill(#000000);
  rect(100,100,200,480);
  rect(400,100,200,480);
 
  
  fill(#CCFFAA);
  fill(#FF0000);
  ellipse(200,200,100,100);
  
  fill(#FFFF00);
  ellipse(200,300,100,100);
  
  fill(#00FF00);
  ellipse(200,400,100,100);
  
//for walk A sign  
  fill(#FF0000);
  stroke(255);
  rect(150,480,100,50);
  fill(#000000);
  textSize(18);
  text("WALK",175,495,100,50);
  
  // light B
  fill(#FF0000);
  ellipse(500,200,100,100);
  
  fill(#FFFF00);
  ellipse(500,300,100,100);
  
  fill(#00FF00);
  ellipse(500,400,100,100);  
  
  //for walk B sign
  
  fill(#FF0000);
  stroke(255);
  rect(450,480,100,50);
  fill(#000000);
  textSize(18);
  text("WALK",475,495,100,50);
  
  fill(#000000);
  
  textSize(32);
  text("Light A",150,50);
  text("Light B",450,50);
  
}



void draw(){
  
  
  String test1;
  test1 ="INPUT,0,1,0,";
  
  myPort.write(test1);
  myPort.write('\n');
  delay(1000);
  }
  
  void serialEvent(Serial p)
  {
String message =p.readStringUntil(LF);
 if(message != null)
 {
 //print(message);
 String [] data =message.split(",");
 
 if(data[0].charAt(0) == '0' && data.length >7)
 {
       my_outputs.A_red_light = int(data[1]);
       my_outputs.A_yellow_light = int(data[2]);
       my_outputs.A_green_light = int(data[3]);
       my_outputs.A_walk_light = int(data[4]);
       
       
       my_outputs.B_red_light = int(data[5]);
       my_outputs.B_yellow_light = int(data[6]);
       my_outputs.B_green_light = int(data[7]);
       my_outputs.B_walk_light = int(data[8]);
    }
 println("A:"+ my_outputs.A_red_light +"" +my_outputs.A_yellow_light +""+my_outputs.A_green_light);
 println("A:"+ my_outputs.B_red_light +"" +my_outputs.B_yellow_light +""+my_outputs.B_green_light);
 }
 


}