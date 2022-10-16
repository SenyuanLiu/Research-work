//Independent study: Color quantization in RGB space
//Russell (Senyuan) Liu
//Supervisor: professor George Legrady
//Realized in Processing 4.0.3

//function: command + '+' : increase k value; '-': decrease k value; 
//function: 'c': change the background color; 'n':next image in file; 'space': change to the corresponding image color quantization

import peasy.*;
PeasyCam camera;

//PImage img, i2; 
int imgNum=5;
PImage[] img=new PImage[imgNum];
PImage[] imgCopy=new PImage[imgNum];
ArrayList<Dot>dots=new ArrayList();
int div=3;
float boxSize=300;
float bs=boxSize+ boxSize*0.2;
float bsh=bs/2;
color[] saveColor=new color[(255)*(255)*(255)];
int[] colorNum=new int[(255)*(255)*(255)];
boolean black=false;
PImage dropIn, saveImage, nowImage, nowImageCopy, pastImage;
int index=0;
PFont font;
boolean getOutsizeImage=false;
void settings() {
  size(1920, 1080, P3D);
}
void setup() { 
  textSize(50);
  camera = new PeasyCam(this, 500);
  colorMode(RGB, div, div, div);//Using the colorMode function to realize K-means. 'div' represent the k value.
  //surface.setResizable(false);
  //loading all the images
  for (int i=0; i<imgNum; i++) {
    img[i]=loadImage(i+".png");    
    img[i].resize(500, 500); 
    imgCopy[i]=img[i].copy();
  }  
  saveImage=imgCopy[index].copy();
  //Implement the images in RGB space by imageProcess
  for (int i=0; i<saveColor.length; i++) {
    saveColor[i]=1; 
    colorNum[i]=0;
  }  
  imageProcess(img[index]);
  createDot(img[index]);
}
void draw() { 
  colorMode(RGB, div, div, div);
  println(frameRate);
  imageMode(CENTER);
  if (black) {
    background(0);  
    stroke(div);
  } else {
    background(div); 
    stroke(0);
  }
  noFill();
  strokeWeight(3);
  box(bs);  
  drawStick();
  for (Dot d : dots) 
  {
    d.display();
  }
  pushMatrix();
  translate(0, 0, -500);
  image(nowImage, -nowImage.width/1, 0);  
  image(nowImageCopy, nowImageCopy.width/1, 0);
  popMatrix();
  camera.beginHUD();  
  text(div, mouseX+30, mouseY);
  camera.endHUD();
}

void drawStick() {   
  strokeWeight(7);  
  stroke(0, div, 0);  
  pushMatrix();
  scale(1.001);
  line(-bsh, bsh, bsh, -bsh, -bsh*1.1, bsh);  
  stroke(0, 0, div);
  line(-bsh, bsh, bsh, -bsh, bsh, -bsh*1.1);   
  stroke( div, 0, 0);
  line(-bsh, bsh, bsh, bsh*1.1, bsh, bsh);  
  popMatrix();
}
