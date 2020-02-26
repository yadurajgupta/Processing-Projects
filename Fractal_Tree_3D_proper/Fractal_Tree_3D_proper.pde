import peasy.*;

float theta_cons=PI/9;
float theta_c=PI/12;
float ini_wid=10.0;
ArrayList<Branch> gen0=new ArrayList<Branch>();
ArrayList<Branch> gen1=new ArrayList<Branch>();
float generation=0.0;
float ColCycle=20.0;
float sh=0.5;
float ini_len=300.0;
PeasyCam camera;
void setup()
{
  size(800, 800, P3D);
  background(0);
  camera=new PeasyCam(this, 800);
  Branch base=new Branch();
  base.ini(ini_len, PI/2, PI/2, new PVector(0, 0, 0));
  //gen0.add(base);
  gen1.add(base);
}
void draw()
{
  background(0);
  colorMode(HSB);
  //translate(width/2,height,0);
  for (Branch b : gen0)
  {
    b.show();
  }
  for (Branch b : gen1)
  {
    b.show();
  }
}
void keyPressed()
{
  generation=generation+1;
  ini_wid=ini_wid/2.0;
  ArrayList<Branch> gen2=new ArrayList<Branch>();
  for (Branch b : gen1)
  {
    gen2.addAll(b.make_child());
  }
  gen0.addAll(gen1);
  gen1.clear();
  gen1.addAll(gen2);
}
