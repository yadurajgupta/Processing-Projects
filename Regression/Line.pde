class Line
{
  float m;
  float c;
  Line(float m_, float c_)
  {
    m=m_;
    c=c_;
  }
  void update(float m_, float c_)
  {
    m=m_;
    c=c_;
    println(m);
    println(c);
  }
  void show()
  {
    stroke(0, 255, 0);
    strokeWeight(linewidth);
    line(givepx(-1), givepy(givey(-1)), givepx(1), givepy(givey(1)));
  }
  float givey(float x_)
  {
    return m*x_+c;
  }
}
