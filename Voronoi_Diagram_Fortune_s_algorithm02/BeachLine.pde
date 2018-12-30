class Beach
{
  PVector center=new PVector();
  float a;
  //int[] x=new int[(int)height];
  int limitd=height;
  int limitu=0;
  void ini(PVector center_, float a_)
  {
    center.set(center_);
    a=a_;
  }
  //void updatevals()
  //{
  //  for (int i=0; i<height; i++)
  //  {
  //    float yr=i-center.y;
  //    float xr=((yr*yr-4.0*a*a)*-1.0);
  //    xr=xr/((float)(4.0*a));
  //    //x[i]=round(xr+center.x);
  //  }
  //}
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
    strokeWeight(1);
    for (float i=0; i<height; i=i+step)
    {
      point(givex(i), i);
    }
  }
  float givex(float y)
  {
    float yr=y-center.y;
    float xr=((yr*yr-4.0*a*a)*-1.0);
    xr=xr/((float)(4.0*a));
    return xr+center.x;
  }
  void showvalB(float y)
  {
    strokeWeight(1);
    point(givex(y), y);
  }
  PVector givecoords(float y)
  {
    return new PVector(givex(y), y);
  }
}
