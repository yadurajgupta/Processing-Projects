ArrayList<PVector> points=new ArrayList<PVector>();

int num=10;
void setup()
{
  fullScreen();
  points.clear();
  for(int i=0;i<num;i++)
  {
   points.add(new PVector(random(width),random(height)));
  }
  stroke(255);
  strokeWeight(1);
  background(0);
  int index;
  float minD;
  for(int i=0;i<width;i++)
  {
    for(int j=0;j<height;j++)
    {
      minD=width+height;
      index=0;
      for(int k=0;k<points.size();k++)
      {
        if( minD > dist( i , j , points.get(k).x , points.get(k).y ))
        {
          minD=dist( i , j , points.get(k).x , points.get(k).y );
          index=k;
        }
      }
      colorMode(HSB);
      stroke(map(index,0,num-1,0,255),255,255);
      point(i,j);
    }
  }
    stroke(255);
    strokeWeight(2);
  for(int i=0;i<points.size();i++)
  {
    render(points.get(i));
  }
}
//void draw()
//{

//}
void render(PVector P)
{
  point(P.x,P.y);
}
