void MakeLine(ArrayList<PVector> A)
{
  float x=0;
  float y=0;
  float len=A.size();
  float x1=0;
  float x2=0;
  boolean isone=true;
  for (PVector P : A)
  {
    x+=((P.x)/len);
    y+=((P.y)/len);
    if (isone)
    {
      x1=P.x;
      x2=P.x;
      isone=false;
    } else 
    {
      if (P.x<x1)
      {
        x1=P.x;
      }
      if (x2<P.x)
      {
        x2=P.x;
      }
    }
  }
  float num=0;
  for (PVector P : A)
  {
    num+=(P.x-x)*(P.y-y);
  }
  float den=0;
  for (PVector P : A)
  {
    den+=(P.x-x)*(P.x-x);
  }
  float m=num/den;
  float b=y-m*x;
  drawLine(x1, x2, m, b);
}
void drawLine(float x1, float x2, float m, float b)
{
  PVector A=new PVector(x1, m*x1+b);
  PVector B=new PVector(x2, m*x2+b);
  line(A.x, A.y, B.x, B.y);
}
