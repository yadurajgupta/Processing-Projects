class Point
{
  PVector pos=new PVector(floor(random(width)), floor(random(height)));
  float r=0;
  Beach B;
  int ID;
  boolean inplay=true;
  color col;
  void setBeach()
  {
    B=new Beach();
    B.center.set(pos);
  }
  void setID(int X)
  {
    ID=X;
  }
  void show()
  {
    pushMatrix();
    stroke(col);
    strokeWeight(4);
    point(pos.x, pos.y);
    popMatrix();
  }
  void setPoint(Point P1)
  {
    pos.x=P1.pos.x;
    pos.y=P1.pos.y;
  }
  float getx()
  {
    return pos.x;
  }
  void setR(float R_)
  {
    r=R_;
  }
  void beachUpdate(float a_)
  {
    B.a=a_;
    // B.updatevals();
  }
  void beachshow()
  {
    stroke(col);
    B.show();
  }
  float getxval(float y)
  {
    return B.givex(y);
  }
  void showval(float y)
  {
    stroke(col);
    B.showvalB(y);
  }
  boolean Pequals(Point P)
  {
    if (floor(pos.x)==floor(P.pos.x) && floor(pos.y)==floor(P.pos.y))
    {
      return true;
    }
    return false;
  }
  PVector coords(float y)
  {
    return B.givecoords(y);
  }
  void setcol()
  {
    colorMode(HSB);
    col= color(random(255), 255, 255);
  }
}
