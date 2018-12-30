float val;
float A[];
float pow_val=2;
float max_val;
void setup()
{
  size(800,800);
  background(0);
  A=new float[width];
  max_val=height;
  stroke(255);
  strokeWeight(1);
}
void draw()
{
  for(int i=0;i<width;i++)
  {
    A[i]=pow(random(0,1),pow_val)*max_val;
  }
  A=sort(A);
  for(int i=0;i<width;i++)
  {
    line(i,height,i,height-A[i]);
  }
}
