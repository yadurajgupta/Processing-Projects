import java.util.*;

ArrayList<Point> points=new ArrayList<Point>();
ArrayList<Point> points1=new ArrayList<Point>();
ArrayList<Tuple> vt=new ArrayList<Tuple>();
int num=10;
int index=0;
float a;
float sweep=-1.5;
float speed=1;
ArrayList<Integer> IDs=new ArrayList<Integer>();
float step=1;
void setup()
{
  //size(800, 800);
  fullScreen();
  background(0);
  float dencity=sqrt(width*height/num)*(0.75);
  for (int i=0; i<num; i++)
  {
    Point P=new Point();
    for (int j=0; j<i; j++)
    {
      if (P.pos.dist(points.get(j).pos)<dencity)
      {
        P=new Point();
        j=-1;
      }
    }
    Point P1=new Point();
    points.add(P);
    points1.add(P1);
  }
  //Collections.sort(points, new SortByElevation());
  merge_sort_start(points, points1);
  int ID=1;
  for (Point P : points)
  {
    P.setcol();
    P.setBeach();
    P.setID(ID);
    ID++;
  }
}
class SortByElevation implements Comparator<Point> {

  public int compare(Point A, Point B) {
    if (floor(A.pos.x)>floor(B.pos.x))
    {
      return 1;
    } else if (A.pos.x==B.pos.x)
    {
      if (floor(A.pos.y)>floor(B.pos.y))
      {
        return 1;
      } else
      {
        return 0;
      }
    }
    return -1;
  }
}
void draw()
{
  background(0);
  stroke(255);
  line(sweep, 0, sweep, height);

  int in=0;
  for (Point P : points)
  {
    in++;
    if (P.inplay)
    {
      P.show();
      if (floor(P.getx())<=floor(sweep)-1)
      {
        P.beachUpdate((sweep-P.pos.x)/2.0);
      } else
      {
        break;
      }
    }
  }
  ArrayList<Point> points2=new ArrayList<Point>();
  boolean on=false;
  Point Pso=new Point();
  for (float i=0; i<height; i=i+step)
  {
    float max=width*2;
    Point Ps=new Point();
    boolean isone=true;
    for (int j=0; j<in; j++)
    {
      Point P=points.get(j);
      if (P.inplay)
      {
        float val=P.getxval(i);
        if (isone)
        {
          max=val;
          Ps=P;
          isone=false;
        } else if (max<val)
        {
          max=val;
          Ps=P;
        }
      }
    }
    if (i!=0)
    {
      if (Pso!=Ps)
      {
        colorMode(HSB);
        int ID1=Pso.ID;
        int ID2=Ps.ID;
        points2.add(Ps);
        Ps.showval(i);
        PVector L=Ps.coords(i);
        //L.set(round(L.x), round(L.y));
        if ((L.x>=0 && L.x<=width) && (L.y>=0 && L.y<=height))
        {
          Tuple temp=new Tuple();
          color col1=Ps.col;
          color col2=Pso.col;
          if (ID1>ID2)
          {
            temp.ini(L, ID1, ID2, col1);
          } else
          {
            temp.ini(L, ID1, ID2, col2);
          }
          vt.add(temp);
          on=true;
        }
        Pso.inplay=false;
        Pso=Ps;
      } else
      {
        Pso.showval(i);
      }
    } else
    {
      points2.add(Ps);
    }
  }
  for (int i=0; i<in-1; i++)
  {
    points.get(i).inplay=false;
  }
  for (Point P : points2)
  {
    P.inplay=true;
  }
  for (int i=0; i<in-1 && i<points.size(); i++)
  {
    if (points.get(i).inplay==false)
      points.remove(points.get(i));
  }
  //stroke(255);
  //strokeWeight(1);
  //for (PVector p : voronoi)
  //{
  //  point(p.x, p.y);
  //}
  sweep+=speed;
  if (!(on ||sweep<width))
  {
    noLoop();
    background(0);
    for (Point P : points1)
    {
      P.show();
    }
    ArrayList<Tuple> vt1=new ArrayList<Tuple>();
    int lent=vt.size();
    for (int i=0; i<lent; i++)
    {
      vt1.add(new Tuple());
    }
    merge_sort_startt(vt, vt1);
    lent=vt.size();
    for (int i=0; i<lent-1; i++)
    {
      ArrayList<PVector> lines=new ArrayList<PVector>();
      colorMode(HSB);
      color col=vt.get(i).col;
      lines.add(vt.get(i).pos);
      while (vt.get(i).checkequal(vt.get(i+1)) && i<lent-2)
      {
        i++;
        lines.add(vt.get(i).pos);
      }
      noFill();
      strokeWeight(2);
      colorMode(HSB);
      stroke(col);
      beginShape();
      for (PVector P : lines)
      {
        vertex(P.x, P.y);
      }
      endShape();
      //stroke(random(255), 255, 255, 100);
      //merge_sort_startp(lines);
      //beginShape();
      //for (PVector P : lines)
      //{
      //  vertex(P.x, P.y);
      //}
      //endShape();
      ////stroke(random(255), 255, 255, 100);
      //MakeLine(lines);
    }
    saveFrame("SAVED"+random(100));
  }
}
