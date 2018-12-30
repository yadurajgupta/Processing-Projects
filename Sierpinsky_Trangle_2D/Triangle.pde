class Triangle
{
  PVector center=new PVector();
  float len=0;
  void ini(PVector center_, float len_)
  {
    center.x=center_.x;
    center.y=center_.y;
    len=len_;
  }
  void show()
  {
    pushMatrix();
    translate(center.x, center.y);
    stroke(255);
    strokeWeight(1);
    noFill();
    beginShape();
    vertex(0, -len);
    vertex(-len*sin(TWO_PI/3.0), -len*cos(TWO_PI/3.0));
    vertex(-len*sin(-TWO_PI/3.0), -len*cos(-TWO_PI/3.0));
    vertex(0, -len);
    endShape();
    popMatrix();
  }
  Triangle make_child1()
  {
    Triangle A=new Triangle();
    A.ini(new PVector(center.x+0, center.y-len/2), len/2);
    return A;
  }
  Triangle make_child2()
  {
    Triangle A=new Triangle();
    A.ini(new PVector(center.x-(len/2)*sin(TWO_PI/3), center.y-(len/2)*cos(TWO_PI/3)), len/2);
    return A;
  }
  Triangle make_child3()
  {
    Triangle A=new Triangle();
    A.ini(new PVector(center.x-(len/2)*sin(-TWO_PI/3), center.y-(len/2)*cos(-TWO_PI/3)), len/2);
    return A;
  }
}
