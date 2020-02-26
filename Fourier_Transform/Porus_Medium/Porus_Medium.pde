int sides=10;
float ang=TWO_PI/3;
Polygon P;
void setup()
{
  size(400,400);
  P=new Polygon(new PVector(width/2,height/2),sides,100);
}
void draw()
{
  background(0);
  P.show();
}
