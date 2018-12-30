ArrayList<Float> points=new ArrayList<Float>();
Float ht; 
void setup()
{
  fullScreen();
  //size(800,800);
  ht=height/2.0;
}
void draw()
{
  frameRate(500);
  translate(0, height/2);
  background(0);
  strokeWeight(0);
  ht+=random(-5, 5);
  //if (ht>height/2.0)
  //{
  //  ht-=height;
  //}
  //if (ht<height/2)
  //{
  //  ht+=height;
  //}
  points.add(ht);
  if (points.size()>width)
  {
    points.remove(points.get(0));
  }
  stroke(255);
  strokeWeight(1);
  for (int i=0; i<points.size()-1; i++)
  {
    if (abs(points.get(i)-points.get(i+1))<=100.0)
    {
      line(i, points.get(i), i+1, points.get(i+1));
    } else if (points.get(i)>height/2.0)
    {
      line(i, points.get(i), i, height/2);
    } else
    {
      line(i, points.get(i), i, -height/2);
    }
  }
  text(points.size(), width/2, height/2);
}
