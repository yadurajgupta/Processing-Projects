class Boundary
{
  PVector pos1;
  PVector pos2;
  PVector coord1;
  PVector coord2;
  PVector coord3;
  PVector coord4;
  Boundary(PVector p, PVector q)
  {
    pos1=new PVector(p.x, p.y);
    pos2=new PVector(q.x, q.y);
    coord1=new PVector(p.x, p.y);
    coord2=new PVector(p.x, q.y);
    coord3=new PVector(q.x, q.y);
    coord4=new PVector(q.x, p.y);
  }
  void show(int x)
  {
    rectMode(CORNER);
    noStroke();
    fill(120);
    rect(pos1.x, pos1.y, pos2.x-pos1.x, pos2.y-pos1.y);
  }
  void show()
  {
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(pos1.x, pos1.y, pos2.x-pos1.x, pos2.y-pos1.y);
  }
  void update(PVector t)
  {
    pos2.set(t.x, t.y);
  }
  boolean isinside(PVector P)
  {
    if (P.x>=min(pos1.x, pos2.x) && P.x<=max(pos1.x, pos2.x) && P.y>=min(pos1.y, pos2.y) && P.y<=max(pos1.y, pos2.y))
    {
      return true;
    }
    return false;
  }
  PVector givePointOfInter(PVector reference, PVector point)
  {
    if (isinside(point))
    {
      return new PVector(reference.x, reference.y);
    }
    return new PVector(point.x, point.y);
  }
}
