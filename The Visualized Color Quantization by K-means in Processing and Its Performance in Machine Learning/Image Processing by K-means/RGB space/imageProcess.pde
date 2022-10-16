void imageProcess(PImage image) 
{
  nowImageCopy=saveImage;
  image.loadPixels(); 
  float r, g, b;
  for (int x=0; x<image.width; x++)
  {  
    for (int y=0; y<image.height; y++) 
    {
      color ic=color(image.pixels[x+y*image.width]);
      r=round(red(ic));
      g=round(green(ic));
      b=round(blue(ic));
      image.pixels[x+y*image.width]=color(r, g, b);
    }
  }
  image.updatePixels();  
  nowImage=image;
}
