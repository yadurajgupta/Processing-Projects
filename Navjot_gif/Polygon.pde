class Polygon
{
  PVector center;
  float len;
  int Sides;
  ArrayList<PVector> points=new ArrayList<PVector>();
  color col;
  PVector Now;
  
  Polygon(PVector P, float len_, int sides)
  {
    Sides=sides;
    center=new PVector();
    center.set(P);
    len=len_;
    make_points();
  }
  void make_points()
  {
    float theta=(2.0*PI)/((float)Sides);
    float r=len/2;
    r=r/sin(theta/2);
    float t=-theta/2.0;
    for (int i=0; i<Sides; i++)
    {
      points.add(new PVector(center.x+r*cos(t), center.y+r*sin(t)));
      t+=theta;
    }
    colorMode(HSB);
    col=color(floor(random(255)),255,255);
  }
  void show()
  {
    beginShape();
    colorMode(HSB);
    stroke(col);
    strokeWeight(5);
    noFill();
    for (PVector P : points)
    {
      vertex(P.x, P.y);
    }
    endShape(CLOSE);
  }
}
