class Circle
{
  PVector pos=new PVector(floor(random(width/2, width)), floor(random(height)));
  color col=color(random(255), 100, 255);
  void show()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(255);
    strokeWeight(1);
    point(0,0);
    popMatrix();
  }
  void show_line(Circle c)
  {
    float x=(c.pos.x+pos.x)/2.0;
    float y=(c.pos.y+pos.y)/2.0;
    stroke(255, 0, 0);
    point(x, y);
  }
  float dist_sq(PVector p)
  {
    return (pos.x-p.x)*(pos.x-p.x)+(pos.y-p.y)*(pos.y-p.y);
    //return abs(pos.x-p.x)+abs(pos.y-p.y);
  }
  void set_col()
  {
    colorMode(HSB);
    col=get(round(pos.x-width/2), round(pos.y));
  }
  void setCir(Circle C)
  {
    pos.set(C.pos);
    col=C.col;
  }
}
