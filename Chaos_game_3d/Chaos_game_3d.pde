import peasy.*;
PeasyCam camera;
PVector point;
ArrayList<PVector> points=new ArrayList<PVector>();
ArrayList<PVector> showing=new ArrayList<PVector>();
Tetrahedron tet;
int max_point=100000;
boolean entered=false;
void setup()
{
  size(1200, 800, P3D);
  camera=new PeasyCam(this, width);
  point=new PVector(random(width), random(width), random(width));
  tet=new Tetrahedron(new PVector(0, 0, 0), height);
  background(0);
  stroke(255);
}
void draw()
{
  background(0);
  tet.show();
  if (!entered)
  {
    entered=true;
    for (int i=0; i<max_point; i++)
    {
      int index=floor(random(points.size()-0.01));
      PVector p=points.get(index);
      point.x=lerp(point.x, p.x, 0.5);
      point.y=lerp(point.y, p.y, 0.5);
      point.z=lerp(point.z, p.z, 0.5);
      showing.add(point.copy());
    }
  }
  for (PVector point : showing)
  {
    stroke(255);
    strokeWeight(1);
    point(point.x, point.y, point.z);
  }
}
