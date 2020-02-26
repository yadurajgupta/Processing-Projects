class Line
{
  float x1, y1, x2, y2;
  Line(int X1, int Y1, int X2, int Y2)
  {
    x1=X1;
    x2=X2;
    y1=Y1;
    y2=Y2;
  }
  void show()
  {
    line(x1, y1, x2, y2);
  }
}
