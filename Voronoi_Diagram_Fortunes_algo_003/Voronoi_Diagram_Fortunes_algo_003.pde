import java.util.*; 
int nump=10;
ArrayList<Point> points=new ArrayList<Point>();
float sweep=0;
void setup()
{
  fullScreen();
  //size(400,400);
  background(0);
  float den=sqrt(((height*width)/nump))*(0.75);
  for (int i=0; i<nump; i++)
  {
    Point P=new Point();
    for (int j=0; j<i; j++)
    {
      if (P.dist(points.get(j))<den)
      {
        j=-1;
        P=new Point();
      }
    }
    points.add(P);
  }
  Collections.sort(points, new SortByx());
  sweep=0;
}


void draw()
{
  background(0);
  sweep+=1;
  drawLine(sweep);
  show_inplay(sweep);
}







void show_inplay(float sweep)
{

  for (Point P : points)
  {
    if (P.pos.x<sweep)
    {
      P.show();
      float a=(sweep-P.pos.x)/2;
      P.updatePara(a);
    } else
    {
      break;
    }
  }
}




void drawLine(float sweep)
{
  stroke(255);
  line(sweep, 0, sweep, height);
}

class SortByx implements Comparator<Point> 
{ 
  public int compare(Point a, Point b) 
  { 
    if (a.pos.x>b.pos.x)
    {
      return 1;
    } else if (a.pos.x==b.pos.x)
    {
      if (a.pos.y>b.pos.y)
      {
        return 1;
      } else if (a.pos.y==b.pos.y)
      {
        return 0;
      }
    }
    return -1;
  }
} 
