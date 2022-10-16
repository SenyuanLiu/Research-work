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
