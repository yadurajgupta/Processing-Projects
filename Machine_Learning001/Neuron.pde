int sign(float val)
{
  if (val>=0)
  {
    return 1;
  } else
  {
    return -1;
  }
}
class Neuron
{
  float [] weights;
  float lr;
  Line NL;
  Neuron(float lr_, int num)
  {
    weights=new float[num];
    for (int i=0; i<num; i++)
    {
      weights[i]=random(-1, 1);
    }
    //for (int i=0; i<num-1; i++)
    //{
    //  weights[i]=random(-1, 1);
    //}
    //weights[num-1]=random(-100,100);
    lr=lr_;
    NL=guessed_line();
  }
  int guess(float []input)
  {
    float sum=0;
    if (input.length==weights.length)
    {
      for (int i=0; i<input.length; i++)
      {
        sum+=weights[i]*input[i];
      }
    }
    return sign(sum);
  }
  void train(float input[])
  {
    int val=guess(input);
    Point P=new Point(input);
    int acc=P.label;
    float err=acc-val;
    for (int i=0; i<weights.length; i++)
    {
      weights[i]+=err*input[i]*lr;
    }
    NL=guessed_line();
  }
  Line guessed_line()
  {
    float w0=weights[0];
    float w1=weights[1];
    float w2=weights[2];
    Line temp=new Line(w0/w1, -w2/w1);
    return temp;
  }
  void show()
  {
    NL.show(1);
  }
}
