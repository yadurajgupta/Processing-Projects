class Curve
{
  PVector current=new PVector();
  ArrayList<PVector> path=new ArrayList<PVector>();
  void setx(float x)
  {
    current.x=x;
  }
  void sety(float y)
  {
    current.y=y;
  }
  void update()
  {
    path.add(current);
    current=new PVector();
  }
  void show()
  {
    strokeWeight(1);
    beginShape();
    noFill();
    for (PVector p : path)
    {
      vertex(p.x, p.y);
    }
    endShape();
    fill(255);
    ellipse((path.get(path.size()-1)).x, (path.get(path.size()-1)).y, grid/10, grid/10);
  }
  void show_end()
  {
    strokeWeight(1);
    beginShape();
    noFill();
    for (PVector p : path)
    {
      vertex(p.x, p.y);
    }
    endShape();
    fill(255);
  }
}
