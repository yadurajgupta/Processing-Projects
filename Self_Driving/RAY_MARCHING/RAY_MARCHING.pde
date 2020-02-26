int boundnum=10;
ArrayList<Boundary> bounds=new ArrayList<Boundary>();
void setup()
{
  size(800,800);
  for(int i=0;i<boundnum;i++)
  {
    float x1=random(width);
    float y1=random(height);
    float x2=random(width);
    float y2=random(height);
    bounds.add(new Boundary(new PVector(x1,y1),new PVector(x2,y2)));
  }
}
void draw()
{
  background(0);
  for(int i=0;i<10;i++)
  {
    float ang=map(i,0,10,0,2*PI);
    Ray ray=new Ray(new PVector(mouseX,mouseY),ang);
    ray.give_Closest_intersection(bounds);
  }
  for(Boundary B:bounds)
  {
    stroke(255);
    B.show();
  }
}
