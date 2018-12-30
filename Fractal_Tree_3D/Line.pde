class Line
{
  float len;
  float theta;
  float phi;
  color col=color(255);
  float wid=ini_wid;
  PVector start=new PVector();
  void ini(float len_, float theta_, float phi_, PVector start_)
  {
    len=len_;
    theta=theta_;
    phi=phi_;
    start=new PVector();
    start.set(start_);
  }
  ArrayList<Line> makeChildren()
  {
    Line A=new Line();
    ArrayList<Line> temp=new ArrayList<Line>();
    float x=-len*cos(phi)*sin(theta_i+PI/4);
    float y=-len*sin(phi)*sin(theta_i+PI/4);
    float z=-len*cos(theta_i+PI/4);
    PVector start_=new PVector(start.x+x, start.y+y, start.z+z);
    //A.ini(len*sh, theta_i+PI/4, phi+PI/3, start_);
    A.ini(len*sh, theta+theta_c, phi+2*PI/3, start_);
    temp.add(A);
    A=new Line();
    //A.ini(len*sh, theta_i+PI/4, phi-PI, start_);
    A.ini(len*sh, theta+theta_c, phi, start_);
    temp.add(A);
    A=new Line();
    //A.ini(len*sh, theta_i+PI/4, phi-PI/3, start_);
    A.ini(len*sh, theta+theta_c, phi-2*PI/3, start_);
    temp.add(A);
    return temp;
  }
  void show()
  {
    pushMatrix();
    float x=-len*cos(phi)*sin(theta_i+PI/4);
    float y=-len*sin(phi)*sin(theta_i+PI/4);
    float z=-len*cos(theta_i+PI/4);
    translate(start.x, start.y, start.z);
    rotateZ(theta);
    //rotate(phi);
    colorMode(HSB);
    strokeWeight(wid);
    stroke(col);
    line(0, 0, 0, x, y, z);
    //translate(x, y, z);
    //sphere(wid/2);
    popMatrix();
  }
  void setcol(color col_)
  {
    col=col_;
  }
}
