class Point
{
  PVector pos=new PVector(random(width),random(height));
  Parabola para=new Parabola();
  void show()
  {
    stroke(255);
    strokeWeight(2);
    point(pos.x,pos.y);
  }
  float dist(Point P)
  {
    return pos.dist(P.pos);
  }
  void updatePara(float a)
  {
    para.setpara(pos,a);
    para.show();
  }
}
