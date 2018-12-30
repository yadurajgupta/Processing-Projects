class Branch
{
  PVector start=new PVector();
  PVector end=new PVector();
  float ang;
  float len;
  color val=color(255, 255, 255);
  float wid=ini_wid;
 // PVector rand=new PVector();
  void Ini(float ang_, float len_, PVector val)
  {
    ang=ang_;
    len=len_;
    start.x=val.x;
    start.y=val.y;
    //rand=PVector.random2D();
    //rand.setMag(random(len*(0.1)));
    //start.add(rand);
  }
  void show()
  {
    pushMatrix();
    stroke(val);
    strokeWeight(wid);
    translate(start.x, start.y);
    rotate(ang);
    line(0, 0, -len, 0);
    noStroke();
    fill(val);
    popMatrix();
    end=new PVector(start.x-len*cos(ang), start.y-len*sin(ang));
  }
  ArrayList<Branch> make_children()
  {
    ArrayList<Branch> temp=new ArrayList<Branch>();
    Branch left_child=new Branch();
    left_child.Ini(ang+ang_c, len*sh, end);
    temp.add(left_child);
    left_child=new Branch();
    left_child.Ini(ang-ang_c, len*sh, end);
    temp.add(left_child);
    return temp;
  }
  void setCol(color col)
  {
    val=col;
  }
}
