class Line
{
  float len;
  float ang;
  PVector start=new PVector();
  void ini(float len_, float ang_, PVector start_)
  {
    len=len_;
    ang=ang_;
    start.x=start_.x;
    start.y=start_.y;
  }
  ArrayList<Line> make_child()
  {
    ArrayList<Line> temp=new ArrayList<Line>();
    Line A=new Line();
    A.ini(len/3.0, ang, start);
    temp.add(A);
    PVector val=new PVector(start.x+(len/3.0)*(cos(ang)), start.y+(len/3.0)*(sin(ang)));
    A=new Line();
    A.ini(len/3.0, ang+PI/3.0, val);
    temp.add(A);
    A=new Line();
    val.add(new PVector((len/3.0)*(cos(ang+PI/3.0)), (len/3.0)*(sin(ang+PI/3.0))));
    A.ini(len/3.0, ang-PI/3.0, val);
    temp.add(A);
    val=new PVector(start.x+(2.0*len/3.0)*(cos(ang)), start.y+(2.0*len/3.0)*(sin(ang)));
    A=new Line();
    A.ini(len/3.0, ang, val);
    temp.add(A);
    return temp;
  }
  void show()
  {
    pushMatrix();
    stroke(255);
    translate(start.x, start.y);
    rotate(ang);
    line(0, 0, len, 0);
    popMatrix();
  }
}
