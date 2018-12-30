float branch_len=250;
float ang_c=PI/7;
float sh=0.7;
ArrayList<Branch> branches0=new ArrayList<Branch>();
ArrayList<Branch> branches1=new ArrayList<Branch>();
Branch trunk;
float ini_wid=50;
color brown=color(100, 60, 30);
color green=color(115, 178, 42);
int generation=0;
void setup()
{
  //size(1280, 800);
  fullScreen();
  background(0);
  trunk=new Branch();
  trunk.Ini(HALF_PI, branch_len, new PVector(width/2, height));
  branches0.add(trunk);
  branches1.add(trunk);
  trunk.show();
  trunk.setCol(brown);
  //frameRate(5);
  //frameRate(20);
}
void draw()
{
  background(0);
  for (Branch b : branches0)
  {
    b.show();
  }
  for (Branch b : branches1)
  {
    b.show();
  }
}
void keyPressed()
{
  if (key=='s')
  {
    saveFrame("generation "+generation);
  } else
  {
    generation++;
    ArrayList<Branch> gen2=new ArrayList<Branch>();
    color col;
    if (ini_wid>3)
    {
      col=brown;
      ini_wid=ini_wid*0.7;
    } else
    {
      col=green;
      if (ini_wid>0.5)
      {
        ini_wid=ini_wid*0.6;
      } else
      {
        ini_wid=ini_wid*0.8;
      }
      sh=0.8;
    }
    for (Branch b : branches1)
    {
      gen2.addAll(b.make_children());
    }
    for (Branch b : gen2)
    {
      b.setCol(col);
    }
    branches0.addAll(branches1);
    branches1.clear();
    branches1.addAll(gen2);
  }
}
