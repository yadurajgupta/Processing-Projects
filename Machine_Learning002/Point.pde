class Point
{
  float x;
  float y;
  int label;
  void reset()
  {
    x=random(-1, 1);
    y=random(-1, 1);
    label=target.givelab(x, y);
  }
  Point()
  {
    x=random(-1, 1);
    y=random(-1, 1);
    label=target.givelab(x, y);
  }
  void show(boolean bool)
  {
    if (bool)
    {
      stroke(0, 255, 0);
      strokeWeight(pointsize);
    } else
    {      
      stroke(255, 0, 0);
      strokeWeight(pointsize);
    }
    point(givepx(x), givepy(y));
  }
  float[] giveinputs()
  {
    float[] temp=new float[2];
    temp[0]=x;
    temp[1]=y;
    return temp;
  }
  float Pdist(Point P)
  {
    return pow((P.x)-x, 2)+pow((P.y)-y, 2);
  }
}
