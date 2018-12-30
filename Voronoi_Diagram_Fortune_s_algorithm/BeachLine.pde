class Beach
{
  PVector center=new PVector();
  float a;
  int[] x=new int[(int)height];
  int limitd=height;
  int limitu=0;
  void ini(PVector center_, float a_)
  {
    center.set(center_);
    a=a_;
  }
  void updatevals()
  {
    for (int i=max(0, limitu); i<min(height, limitd); i++)
    {
      float yr=i-center.y;
      float xr=((yr*yr-4.0*a*a)*-1.0);
      xr=xr/((float)(4.0*a));
      x[i]=round(xr+center.x);
    }
  }
  void show()
  {
    //pushMatrix();
    //float t=-1;
    //stroke(255);
    //strokeWeight(1);
    //beginShape();
    //noFill();
    //while (-a*t+center.x>0)
    //{
    //  vertex(-a*t+center.x, center.y+2*a*sqrt(t+1));
    //  t+=0.1;
    //}
    //endShape();
    //t=-1;
    //beginShape();
    //while (-a*t>-center.x)
    //{
    //  vertex(-a*t+center.x, center.y+-2*a*sqrt(t+1));
    //  t+=0.1;
    //}
    //endShape();
    //popMatrix();
    stroke(255);
    strokeWeight(1);
    for (int i=max(0, limitu); i<min(limitd, height); i++)
    {
      point(x[i], i);
    }
  }
  float givex(int y)
  {
    return x[y];
  }
  void showvalB(int y)
  {
    stroke(255);
    strokeWeight(1);
    point(x[y], y);
  }
  PVector givecoords(int y)
  {
    return new PVector(x[y], y);
  }
}
