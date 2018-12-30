ArrayList<Rocket>rockets = new ArrayList<Rocket>();
int rocketsnum=100;
PVector origin;
PVector centbottom;
PVector centtop;
float target_size=40;
float rocketsize=20;
float rocketangle=PI/8;
color rocketcol;
Target target;
int lifeSpan=400;
int gentime=600;
int timepassed;
Evolution evo;
int gen_done=10;
int gen_passed;
float mutation_rate=0.01;
ArrayList<Bound> boundaries=new ArrayList<Bound>();
void setup()
{
  //size(600, 600);
  fullScreen();
  origin=new PVector(0, 0, 0);
  centbottom=new PVector(0, height/2-50, 0);
  centtop=new PVector(0, -height/2+50, 0);
  Rocket temp;
  for (int i=0; i<rocketsnum; i++)
  {
    temp=new Rocket(centbottom, lifeSpan);
    rockets.add(temp);
  }
  evo=new Evolution();
  rocketcol=color(29, 255, 255);
  target=new Target(centtop);
  timepassed=0;
  gen_passed=0;
  background(0);
}
void draw()
{
  frameRate(1000);
  background(0);
  translate(width/2, height/2);
  textAlign(RIGHT);
  text("GENERATION "+(gen_passed+1), width/2, height/2-20);   
  for (Rocket rocket : rockets)
  {
    rocket.show();
    rocket.update();
    rocket.checkcol();
  }
  target.show();
  timepassed++;
  if (timepassed>gentime)
  {
    evo.cals_fit();
    rockets=evo.evolve();
    timepassed=0;
    gen_passed++;
  }
}
