float len=100;
int num=67;
ArrayList<Polygon> polygons=new ArrayList<Polygon>();
PVector Center=new PVector();
void setup()
{
  //size(400,400);
  fullScreen();
  background(0);
  Center.set(new PVector(width/2, height/2));
  for (int i=3; i<num+3; i++)
  {
    Polygon P=new Polygon(Center, len, i);
    polygons.add(P);
  }
}
void draw()
{
  background(255);
  for (Polygon P : polygons)
  {
    P.show();
  }
}
