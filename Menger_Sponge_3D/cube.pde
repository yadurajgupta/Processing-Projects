class Cube
{
  PVector center=new PVector();
  float len=0;
  void ini(PVector pos_, float len_)
  {
    center.set(pos_);
    len=len_;
  }
  void show()
  {
    pushMatrix();
    fill(100,240,255);
    noStroke();
    //stroke(255);
    //strokeWeight(2);
    translate(center.x, center.y, center.z);
    box(len);
    popMatrix();
  }
  ArrayList<Cube> give_children()
  {
    ArrayList<Cube> tempCube=new ArrayList<Cube>();
    for (int l=-1; l<=1; l++)
    {
      for (int j=-1; j<=1; j++)
      {
        for (int k=-1; k<=1; k++)
        {
          if (abs(l)+abs(j)+abs(k)>1)
          {
            PVector tempcent=new PVector(center.x+l*len/3, center.y+j*len/3,center.z+k*len/3);
            Cube A=new Cube();
            A.ini(tempcent,len/3);
            tempCube.add(A);
          }
        }
      }
    }
    return tempCube;
  }
}
