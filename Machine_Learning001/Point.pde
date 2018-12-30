class Point
{
  float x;
  float y;
  float bias;
  int label;
  Point(float[] input)
  {
    x=input[0];
    y=input[1];
    bias=input[2];    
    label=L.giveLabel(x, y);
  }
  Point(float bias_, Line L)
  {
    x=random(-width/2, width/2);
    y=random(-height/2, height/2);
    bias=bias_;
    label=L.giveLabel(x, y);
  }
  void show(int col)
  {
    strokeWeight(10);
    if (col==1)
    {
      stroke(0, 255, 0);
    } else
    {
      stroke(255, 0, 0);
    }
    point(x, y);
  }
}
