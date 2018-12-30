Planet sun;
float sunr=200;
PVector sun_pos=new PVector();
PVector zero=new PVector(0, 0);
int bodies=10;
Planet [] planets=new Planet[bodies];
float Gc=10000;
int i, j;
void setup()
{
  size(800, 800);
  background(0);
  sun_pos.set(width/2, height/2);
  sun=new Planet();
  sun.is_sun();
  for (i=0; i<bodies; i++)
  {
    planets[i]=new Planet();
    planets[i].random_planet();
    //checkCollision(i);
  }
}
void draw()
{
  background(0);
  sun.show();
  for (i=0; i<bodies; i++)
  {
    planets[i].show();
    stroke(255);
    strokeWeight(2);
    line(sun_pos.x, sun_pos.y, planets[i].pos.x, planets[i].pos.y);
    noStroke();
    planets[i].update();
  }
  println(sun.pos.dist(planets[0].pos));
}
void checkCollision(int k)
{
  planets[k].random_planet();
  if (sun.checkCollision(planets[k])==0)
  {
    checkCollision(k);
  }
  j=0;
  while (planets[j]!=null)
  {
    if (planets[k].checkCollision(planets[j])==0)
    {
      checkCollision(k);
    }
    j++;
  }
}
