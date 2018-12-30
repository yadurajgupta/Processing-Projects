class Parabola
{
  PVector pos=new PVector();
  float a;
  void setpara(PVector pos_, float a_)
  {
    pos.set(pos_);
    a=a_;
  }
  void show()
  {
    pushMatrix();
    stroke(255);
    noFill();
    float t=-1;
    beginShape();
    while (pos.x-a*t*t+a>0)
    {
      point(pos.x-a*t*t+a, pos.y-2*a*t);
      t+=0.01;
    }
    endShape();    
    stroke(255);
    noFill();
    t=-1;
    beginShape();
    while (pos.x-a*t*t+a>0)
    {
      point(pos.x-a*t*t+a, pos.y+2*a*t);
      t+=0.01;
    }
    endShape(); 
    popMatrix();
  }
}
