class Circle
{
  int rate;
  float size;
  PVector center;
  PVector center_child;
  float theta=0;
  Circle child=null;
  Circle(int rate_, PVector center_)
  {
    rate=rate_;
    center=new PVector();
    center.set(center_);
    center_child=new PVector(0, 0);
    size=len*(4.0/(((float)rate)*PI));
  }
  Circle make_child()
  {
    Circle child_T=new Circle(rate+2,center_child);
    child=child_T;
    return child_T;
  }
  void show()
  {
    noFill();
    ellipse(center.x, center.y, size, size);
    theta+=(((((float)rate)/speed)))*PI;
    center_child.set(center.x+(size*cos(theta)/2.0), center.y+(size*sin(theta)/2.0));
    line(center.x, center.y, center_child.x, center_child.y);
    if (child!=null)
    {
      (child.center).set(center_child);
      child.show();
    }
  }
}
