import peasy.*;
float theta_i=0;
float theta_c=PI/5;
float ini_len=200;
float ini_wid=10;
ArrayList<Line> gen0=new ArrayList<Line>();
ArrayList<Line> gen1=new ArrayList<Line>();
float r=0;
float sh=0.5;
float generation=0;
Line base;
PeasyCam camera;
void setup()
{
  size(800, 800, P3D);
  colorMode(HSB);
  background(0);
  camera=new PeasyCam(this,800);
  base=new Line();
  base.ini(ini_len, theta_i, 0, new PVector(0,0,0));
  gen0.add(base);
  gen1.add(base);
}
void draw()
{
  background(0);
  //sphere(10);
 // lights();
  //rotate(PI);
  //rotateX(r);
  //rotateY(0.1*r);
  //translate(width/2,height/2);
  // rotateZ(0.4*r);
  //r=r+0.01;
  rotateX(-PI/2);
//translate(width/2,height/2);
  for (Line l : gen0)
  {
    l.show();
  }
  for (Line l : gen1)
  {
    l.show();
  }
}
void keyPressed()
{
  ArrayList<Line> gen2=new ArrayList<Line>();
  ini_wid=2.0*ini_wid/3.0;
  for (Line l : gen1)
  {
    gen2.addAll(l.makeChildren());
  }
  color col_=color((generation*25)%255, 255, 255);
  generation+=2;
  for (Line l : gen2)
  {
    l.setcol(col_);
  }
  gen0.addAll(gen1);
  gen1.clear();
  gen1.addAll(gen2);
}
