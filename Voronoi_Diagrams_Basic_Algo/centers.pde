class Circle
{
  PVector pos=new PVector();
  color col=color(random(255),100,255);
  void show()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(255);
    strokeWeight(1);
    fill(255);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  void ini()
  {
    pos.set(random(width),random(height));
  }
  void show_line(Circle c)
  {
    float x=(c.pos.x+pos.x)/2.0;
    float y=(c.pos.y+pos.y)/2.0;
    stroke(255,0,0);
    point(x,y);
  }
  float dist_sq(PVector p)
  {
    return (pos.x-p.x)*(pos.x-p.x)+(pos.y-p.y)*(pos.y-p.y);
  }
}
