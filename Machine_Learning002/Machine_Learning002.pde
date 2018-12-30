Line target;
Neuron brain;
int pointsize=4;
int linewidth=4;
int pointNum=10000;//number of points
Point[] points=new Point[pointNum];//array of new points
int trainNum=10000;//Number pof points to train per frame
int pointIndex;
void setup()
{
  fullScreen();  
  background(0);
  initialize();
  reset();
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  target.show(0);
  brain.show();
  int wrongCount=0;
  for (Point P : points)
  {
    if (P.label==brain.guess(P.giveinputs()))
    {
      //P.show(true);
    } else
    {
      //P.show(false);
      wrongCount++;
      //if (wrongCount>0)
      //{
      //  break;
      //}
    }
  }
  train(brain);
  if (wrongCount==0)
  {
    background(0);
    target.show(0);
    brain.show();
    reset();
    //saveFrame("Done"+random(100));
  }
}
void initialize()
{
  target=new Line(0, 0);
  brain=new Neuron(0.00001, 3);
  for (int i=0; i<pointNum; i++)
  {
    points[i]=new Point();
  }
}
void reset()
{
  target.reset();
  brain.reset();
  for (int i=0; i<pointNum; i++)
  {
    points[i].reset();
  }
  pointIndex=0;
}
void train(Neuron brain)
{
  int i=0;
  while (i<trainNum)
  {
    while (i<trainNum && pointIndex<pointNum)
    {
      brain.train(points[pointIndex].giveinputs());
      i++;
      pointIndex++;
    }
    if (pointIndex==pointNum)
    {
      pointIndex=0;
    }
  }
}
