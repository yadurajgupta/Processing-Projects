class Line
{
  float m;
  float c;
  void reset()
  {
    m=tan(random(degrees(360)));
    c=random(-1, 1);
  }
  Line(float m_, float c_)
  {
    m=m_;
    c=c_;
  }
  void update(float m_, float c_)
  {
    m=m_;
    c=c_;
  }
  void show(int x)
  {
    if (x==0)
    {
      stroke(0, 255, 0);
      strokeWeight(linewidth);
    } else
    {
      stroke(255, 0, 0);
      strokeWeight(linewidth/2);
    }
    line(givepx(-1), givepy(givey(-1)), givepx(1), givepy(givey(1)));
    showIntercept();
  }
  float givey(float x_)
  {
    return m*x_+c;
  }
  int givelab(float x_, float y_)
  {
    if (givepy(y_)>=givepy(target.givey(x_)))
    {
      return 1;
    } else
    {
      return -1;
    }
  }
  void showIntercept()
  {
    colorMode(HSB);
    stroke(200, 255, 255);
    strokeWeight(4*linewidth);
    point(givepx(0), givepy(givey(0)));
    colorMode(RGB);
  }
}
