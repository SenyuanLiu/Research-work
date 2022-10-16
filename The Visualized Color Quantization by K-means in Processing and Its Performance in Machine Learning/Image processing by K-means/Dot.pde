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
