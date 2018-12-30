Neuron n;
int pointn=100;
Line L;
Point[] points=new Point[pointn];
int pointindex;
void setup()
{
  size(500, 500);
  background(0);
  n=new Neuron(0.00001, 3);
  L=new Line(1, 0);
  for (int i=0; i<pointn; i++)
  {
    points[i]=new Point(1, L);
  }
  pointindex=0;
}
void draw()
{
  background(0);
  translate(width/2, height/2);
  boolean done=true;
  for (Point pt : points)
  {
    if (pt.label==n.NL.giveLabel(pt.x, pt.y))
    {
      pt.show(1);
    } else
    {
      pt.show(0);
      done=false;
    }
  }
  L.show(0);
  Point P=points[pointindex];
  pointindex++;
  if (pointindex==pointn)
  {
    pointindex=0;
  }
  float[] input=new float[3];
  input[0]=P.x;
  input[1]=P.y;
  input[2]=P.bias;
  n.train(input);
  n.show();
  if (done)
  {
    L=new Line(random(-10, 10), 0);
    n=new Neuron(0.00001, 3);
    for (int i=0; i<pointn; i++)
    {
      points[i]=new Point(1, L);
    }
    pointindex=0;
  }
  //rotate(-PI);
}
