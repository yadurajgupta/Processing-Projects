class Polygon
{
  PVector center;
  int sides;
  float size;
  Polygon(PVector center_,int sides_,float size_)
  {
    center=new PVector();
    center.set(center_);
    sides=sides_;
    size=size_;
  }
  void show()
  {
    pushMatrix();
    translate(center.x,center.y);
    float ang=TWO_PI/((float)sides);
    beginShape();
    fill(255);
    noStroke();
    for(int i=0;i<sides;i++)
    {
      float a=ang*((float)i+0.5);
      vertex(size*cos(a),size*sin(a));
    }
    endShape(CLOSE);
    popMatrix();
  }
}
