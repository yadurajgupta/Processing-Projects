float r=0;
ArrayList<Circle> circles=new ArrayList<Circle>();
int num=100;
void setup()
{
  size(500, 500);
  background(0);
  colorMode(HSB);
  for (int i=0; i<num; i++)
  {
    Circle cir=new Circle();
    cir.ini();
    circles.add(cir);
  }
}
void draw()
{
  background(0);
  for (Circle c : circles)
  {
    c.show();
  }
  for (int i=0; i<width; i++)
  {
    for (int j=0; j<height; j++)
    {
      color col=color(0, 0, 0);
      float min=pow(max(width, height), 2);
      boolean isone=true;
      for (Circle c : circles)
      {
        float l=c.dist_sq(new PVector(i, j));
        if (isone)
        {
          min=l;
          col=c.col;
          isone=false;
        } else if (min>l)
        {
          min=l;
          col=c.col;
        }
      }
      stroke(col);
      strokeWeight(1);
      point(i, j);
    }
  }
  r+=1;
}
void mousePressed()
{
  float x=mouseX;
  float y=mouseY;
  boolean isone=true;
  float min=0;
  Circle s=new Circle();
  for (Circle c : circles)
  {
    float l=c.dist_sq(new PVector(x, y));
    if (isone)
    {
      min=l;
      isone=false;
      s=c;
    } else if (min>l)
    {
      min=l;
      s=c;
    }
  }
  circles.remove(s);
  s=new Circle();
  s.ini();
  circles.add(s);
}
