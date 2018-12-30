class Neuron
{
  float []weights;
  float lr;
  float bias=1;
  Line guessed;
  void reset()
  {
    for (int i=0; i<weights.length; i++)
    {
      weights[i]=random(-1, 1);
    }
    guessed=new Line(0, 0);
    updateLine();
  }
  Neuron(float lr_, int inputs_)
  {
    lr=lr_;
    weights=new float[inputs_];
    for (int i=0; i<weights.length; i++)
    {
      weights[i]=random(-1, 1);
    }
    guessed=new Line(0, 0);
    updateLine();
  }
  int guess(float []inputs)
  {
    float sum=weights[weights.length-1]*bias;
    for (int i=0; i<inputs.length; i++)
    {
      sum+=weights[i]*inputs[i];
    }
    return sign(sum);
  }
  void train(float []inputs)
  {
    int guesslab=guess(inputs);
    int acclab=target.givelab(inputs[0], inputs[1]);
    int error=acclab-guesslab;
    for (int i=0; i<inputs.length; i++)
    {
      weights[i]+=inputs[i]*error*lr;
    }
    weights[weights.length-1]+=bias*error*lr;
    updateLine();
  }
  int sign(float x_)
  {
    if (x_>=0)
    {
      return 1;
    } else
    {
      return -1;
    }
  }
  void updateLine()
  {
    float w0=weights[0];
    float w1=weights[1];
    float w2=weights[2];
    guessed.update(-w0/w1, -w2/w1);
  }
  void show()
  {
    guessed.show(1);
  }
}
