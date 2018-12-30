ArrayList<Object> objects=new ArrayList<Object>();
ArrayList<Creature> creatures=new ArrayList<Creature>();
int numc=10;
int numf=40;
int nump=20;
float foodsize=10;
float VIS=100;
float creasize=20;
float creang=PI/8;
color creacol;
color foodcol;
color poicol;
float foodmindist=VIS;
float maxForce=0.1;
float disteaten=1*foodsize;
float maxspeed=0.1;
void setup()
{
  //size(800, 800);
  fullScreen();
  foodcol=color(0, 255, 0);
  poicol=color(255, 0, 0);
  colorMode(HSB);
  creacol=color(29, 255, 255);
  for (int i=0; i<numc; i++)
  {
    Creature C=new Creature();
    C.ini();
    creatures.add(C);
  }
  for (int i=0; i<numf+nump; i++)
  {
    Object O=new Object();
    O.ini();
    if (i<numf)
    {
      O.setfood();
    }
    for (int j=0; j<i; j++)
    {
      if (O.check_close(objects.get(j)))
      {
        O=new Object();
        O.ini();
        if (i<numf)
        {
          O.setfood();
        }
        j=-1;
      }
    }
    objects.add(O);
  }
}
void draw()
{
  //frameRate(20);
  background(0);
  for (Object O : objects)
  {
    O.show();
  }
  for (Creature C : creatures)
  {
    C.update();
    C.show();
  }
  for (Object O : objects)
  {
    O.ifeaten();
  }
}
