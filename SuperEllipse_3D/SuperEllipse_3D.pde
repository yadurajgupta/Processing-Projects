float a;
float b;
float c;
float theta;
float phi;
float n;
void setup()
{
  size(550, 550, P3D);
  background(0);
  a=((width)*(0.95))/2.0;
  b=((height)*(0.95))/2.0;
  c=random(a, b);
  n=random(2, 10);
}
void draw()
{
  phi=0;
  while (phi<PI)
  {
    float x=a*pow((sin(theta)*cos(phi)), 2/n);
    float y=b*pow((sin(theta)*sin(phi)), 2/n);
    float z=c*pow((cos(theta)), 2/n);
    phi+=0.01;
  }
  theta+=0.01;
}
