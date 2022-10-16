//Independent study: Color quantization 'saving images' function; HSB version
//Russell (Senyuan) Liu
//Supervisor: professor George Legrady
//Realized in Processing 4.0.3

ArrayList<PImage>img=new ArrayList();
ArrayList<PImage>imgCopy=new ArrayList();
PImage pimg, pimgCopy;
int div=8;
PImage  saveImage, nowImage, nowImageCopy, pastImage;
int index=0;
void setup() { 
  size(100, 100, P2D);
  colorMode(HSB, div, div, div);
  int imgindex=0;
  //to load the images stored in 'input' folder; note: pictures should be ordered and renamed to 'input(i)'.
  while (loadImage("car_input/car"+(imgindex+1)+".jpg")!=null) {
    //img.add(loadImage("input/input ("+(imgindex+1)+").jpg"));
    //imgCopy.add(loadImage("input/input ("+(imgindex+1)+").jpg"));
    pimg=loadImage("car_input/car"+(imgindex+1)+".jpg");
    pimgCopy=loadImage("car_input/car"+(imgindex+1)+".jpg");
    saveImage=pimgCopy.copy();
    imageProcess(pimg);
    nowImage.save("car_output/car"+(imgindex+1)+".jpg");
    imgindex++;
  }
  exit();
}
ArrayList<Dot>dots=new ArrayList();
color[] saveColor=new color[(255)*(255)*(255)];
int[] colorNum=new int[(255)*(255)*(255)];
float boxSize=300;
float bs=boxSize+ boxSize*0.2;
float bsh=bs/2;
class Dot {
  float x, y, z;
  color fc;
  float size;
  Dot(float a, float b, float c, color cc, float s) 
  {
    x=a;
    y=b;
    z=c;
    fc=cc;
    size=s;
  }
  void display() {
    if (size>0.1) {
      pushMatrix();
      translate(x, y, z);
      fill(fc);
      noStroke();
      sphere(size+1);
      popMatrix();
    }
  }
}
void createDot(PImage image) {   
  dots=new ArrayList();
  for (int i=0; i<saveColor.length; i++) {
    saveColor[i]=1; 
    colorNum[i]=0;
  }   
  int allPixelNum=image.height*image.width;
  image.loadPixels();
  float h, s, b;  
  color ic;
  for (int x=0; x<image.width; x++) {  
    for (int y=0; y<image.height; y++) {
      ic=color(image.pixels[x+y*image.width]);
      h=round(hue(ic));
      s=round(saturation(ic));
      b=round(brightness(ic));
      for (int i=0; i<saveColor.length; i++) {
        if (saveColor[i]==1) {
          saveColor[i]=ic;
          colorNum[i]++;
          i=saveColor.length;
        } else if (saveColor[i]==ic) {
          colorNum[i]++;
          i=saveColor.length;
        }
      }
    }
  }   
  for (int i=0; i<saveColor.length; i++) {  
    if (saveColor[i]!=1) {
      ic=saveColor[i];
      h=round(hue(ic));
      s=round(saturation(ic));
      b=round(brightness(ic));
      float ss=map((colorNum[i]), 0, (allPixelNum), 0, boxSize*1);
      dots.add(new Dot(map(h, 0, div, -boxSize/2, boxSize/2), map(s, 0, div, boxSize/2, -boxSize/2), map(b, 0, div, boxSize/2, -boxSize/2), ic, ss));
    } else {
      i=saveColor.length;
    }
  }
}
void imageProcess(PImage image) 
{  
  colorMode(HSB, div, div, div);
  nowImageCopy=saveImage;
  image.loadPixels(); 
  float h, s, b;
  for (int x=0; x<image.width; x++)
  {  
    for (int y=0; y<image.height; y++) 
    {
      color ic=color(image.pixels[x+y*image.width]);
      h=round(hue(ic));
      s=round(saturation(ic));
      b=round(brightness(ic));
      image.pixels[x+y*image.width]=color(h, s, b);
    }
  }
  image.updatePixels();  
  nowImage=image;
}
