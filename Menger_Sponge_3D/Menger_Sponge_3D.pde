import peasy.*;
float ini_len=350;
PeasyCam camera;
PVector cent;
Cube base;
//int i, j, k;
float x=0;
float y=0;
ArrayList<Cube> cubes=new ArrayList<Cube>();
void setup()
{
  size(800, 800, P3D);
  background(100);
  base=new Cube();
  camera =new PeasyCam(this, 800);
  cent=new PVector(0, 0, 0);
  base.ini(cent, ini_len);
  cubes.add(base);
}
void draw()
{
  background(100);
  camera();
  pointLight(255, 240, 190, 0, -500, 1000);
  camera.feed();
  //lights();
  for (int i=0; i<cubes.size(); i++)
  {
    cubes.get(i).show();
  }
}
void mousePressed()
{
  //ArrayList<Cube> temp=new ArrayList<Cube>();
  //for (int i=0; i<cubes.size(); i++)
  //{
  //  temp.addAll((cubes.get(i)).give_children());
  //}
  //cubes.clear();
  //cubes.addAll(temp);
}
void keyPressed()
{
  ArrayList<Cube> temp=new ArrayList<Cube>();
  for (int i=0; i<cubes.size(); i++)
  {
    temp.addAll((cubes.get(i)).give_children());
  }
  cubes.clear();
  cubes.addAll(temp);
}
