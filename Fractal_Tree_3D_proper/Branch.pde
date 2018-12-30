class Branch
{
  float wid=ini_wid;
  color col=color((generation*255.0/ColCycle)%255, 255, 255);
  PVector start=new PVector();
  float len;
  float theta;
  float phi;
  void ini(float len_, float theta_, float phi_, PVector start_)
  {
    len=len_;
    theta=theta_;
    phi=phi_;
    start.set(start_);
  }
  void show()
  {
    pushMatrix();
    translate(start.x, start.y, start.z);
    strokeWeight(wid);
    stroke(col);
    float x=len*(cos(phi))*(sin(theta_c));
    float y=len*(sin(phi))*(sin(theta_c));
    float z=len*(cos(theta_c));
    PVector k=new PVector(-sin(phi), cos(phi), 0);
    PVector a=new PVector(x, y, z);
    PVector ar=new PVector(0, 0, 0);
    ar.add(a.mult(cos(theta)));
    ar.add((k.cross(a)).mult(sin(theta)));
    ar.add(k.mult((k.dot(a))*(1-cos(theta))));
    line(0, 0, 0, ar.x, ar.y, ar.z);
    popMatrix();
  }
  ArrayList<Branch> make_child()
  {
    ArrayList<Branch> nextGen=new ArrayList<Branch>();
    float x=len*(cos(phi))*(sin(theta_c));
    float y=len*(sin(phi))*(sin(theta_c));
    float z=len*(cos(theta_c));
    PVector k=new PVector(-sin(phi), cos(phi), 0);
    PVector a=new PVector(x, y, z);
    PVector ar=new PVector(0, 0, 0);
    ar.add(a.mult(cos(theta)));
    ar.add((k.cross(a)).mult(sin(theta)));
    ar.add(k.mult((k.dot(a))*(1-cos(theta))));
    ar.add(start);

    Branch A=new Branch();
    A.ini(len*sh, theta+theta_c, phi, ar);
    nextGen.add(A);

    A=new Branch();
    A.ini(len*sh, theta+theta_c, phi+2*PI/3, ar);
    nextGen.add(A);

    A=new Branch();
    A.ini(len*sh, theta+theta_c, phi-2*PI/3, ar);
    nextGen.add(A);

    return nextGen;
  }
}
