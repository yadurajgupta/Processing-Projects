Line base1;
Line base2;
Line base3;
float ini_len=500;
ArrayList<Line> lines1=new ArrayList<Line>();
ArrayList<Line> lines2=new ArrayList<Line>();
ArrayList<Line> lines3=new ArrayList<Line>();

void setup()
{
  size(800, 800);
  background(0);
  base1=new Line();
  base1.ini(ini_len, -PI, new PVector(width/2+(ini_len/2.0), height/2-(ini_len/(2*sqrt(3)))));
  lines1.add(base1);
  base2=new Line();
  base2.ini(ini_len, PI/3, new PVector(width/2-(ini_len/2.0), height/2-(ini_len/(2*sqrt(3)))));
  lines2.add(base2);
  base3=new Line();
  base3.ini(ini_len, -PI/3, new PVector(width/2, height/2+(ini_len/sqrt(3))));
  lines3.add(base3);
}
void mousePressed()
{
  ArrayList<Line> temp=new ArrayList<Line>();
  for (Line l : lines1)
  {
    temp.addAll(l.make_child());
  }
  lines1.clear();
  lines1.addAll(temp);
  temp.clear();
  for (Line l : lines2)
  {
    temp.addAll(l.make_child());
  }
  lines2.clear();
  lines2.addAll(temp);
  temp.clear();
  for (Line l : lines3)
  {
    temp.addAll(l.make_child());
  }
  lines3.clear();
  lines3.addAll(temp);
  temp.clear();
}
void keyPressed()
{
  ArrayList<Line> temp=new ArrayList<Line>();
  for (Line l : lines1)
  {
    temp.addAll(l.make_child());
  }
  lines1.clear();
  lines1.addAll(temp);
  temp.clear();
  for (Line l : lines2)
  {
    temp.addAll(l.make_child());
  }
  lines2.clear();
  lines2.addAll(temp);
  temp.clear();
  for (Line l : lines3)
  {
    temp.addAll(l.make_child());
  }
  lines3.clear();
  lines3.addAll(temp);
  temp.clear();
}
void draw()
{
  background(0);
  for (Line l : lines1)
  {
    l.show();
  }
  for (Line l : lines2)
  {
    l.show();
  }
  for (Line l : lines3)
  {
    l.show();
  }
}
