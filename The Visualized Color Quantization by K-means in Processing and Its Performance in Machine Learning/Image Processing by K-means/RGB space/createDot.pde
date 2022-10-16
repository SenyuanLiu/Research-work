void createDot(PImage image) {   
  dots=new ArrayList();
  for (int i=0; i<saveColor.length; i++) {
    saveColor[i]=1; 
    colorNum[i]=0;
  }   
  int allPixelNum=image.height*image.width;
  image.loadPixels();
  float r, g, b;  
  color ic;
  for (int x=0; x<image.width; x++) {  
    for (int y=0; y<image.height; y++) {
      ic=color(image.pixels[x+y*image.width]);
      r=round(red(ic));
      g=round(green(ic));
      b=round(blue(ic));
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
      r=(red(ic));
      g=(green(ic));
      b=(blue(ic));
      float s=map((colorNum[i]), 0, (allPixelNum), 0, boxSize*1);
      dots.add(new Dot(map(r, 0, div, -boxSize/2, boxSize/2), map(g, 0, div, boxSize/2, -boxSize/2), map(b, 0, div, boxSize/2, -boxSize/2), ic, s));
    } else {
      i=saveColor.length;
    }
  }
}
