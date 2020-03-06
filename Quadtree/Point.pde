class Point
{
  float x, y;
  Point(float x_, float y_)
  {
    x=x_;
    y=y_;
  }
  void show()
  {
    stroke(255);
    strokeWeight(4);
    point(x, y);
  }
  void highLight()
  {
    stroke(0, 255, 0);
    strokeWeight(8);
    point(x, y);
  }
}
