class Line
{
  float m;
  float c;
  Line(float m_, float c_)
  {
    m=-1*m_;
    c=c_;
  }
  float givey(float x)
  {
    return m*x+c;
  }
  void show(int x)
  {
    strokeWeight(1);
    if (x==0)
    {
      stroke(0,255,0);
    } else
    {
      stroke(255,0,0);
    }
    line(-width/2, givey(-width/2), width/2, givey(width/2));
  }
  int giveLabel(float x, float y)
  {
    if (y>givey(x))
    {
      return (int)(-m/abs(m));
    } else
    {
      return (int)(m/abs(m));
    }
  }
}
