import peasy.*;
float scale=10*PI;
float res=50;
PeasyCam p;
float givez(float x, float y)
{
  return map(sin(x)+sin(y),-2,2,-5,5);
}
void setup()
{
  //size(400, 400, P3D);
  fullScreen(P3D);
  p=new PeasyCam(this, 100*scale);
  background(0);
};
void draw()
{
  lights();
  background(0);
  stroke(255);
  fill(255);
  noStroke();
  for (float x=-scale/2.0; x<scale/2.0; x+=scale/res)
  {
    for (float y=-scale/2.0; y<scale/2.0; y+=scale/res)
    {
      beginShape();
      colorMode(HSB);
      vertex(100.0*x, 100.0*y, 100.0*givez(x, y));
      vertex(100.0*(x+scale/res), 100.0*y, 100.0*givez(x+scale/res, y));
      vertex(100.0*(x+scale/res), 100.0*(y+scale/res), 100.0*givez(x+scale/res, y+scale/res));
      vertex(100.0*x, 100.0*(y+scale/res), 100.0*givez(x, y+scale/res));
      endShape();
    }
  }
}
