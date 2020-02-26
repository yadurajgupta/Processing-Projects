class Node
{
  float weights[];
  Node(int weigthsnum)
  {
    weights=new float[weigthsnum];
    for (int i=0; i<weights.length; i++)
    {
      weights[i]=random(-1, 1);
    }
  }
  float output(float inp[])
  {
    float ans=0;
    if (inp.length==weights.length-1)
    {
      for (int i=0; i<inp.length; i++)
      {
        ans+=weights[i]*inp[i];
      }
      ans+=weights[inp.length];
    } else
    {
      println("NODE ERROR");
      exit();
    }
    return activation_func(ans);
  }
  void copy(Node to)
  {
    int mutation_index=(int)random(weights.length);
    float mut=random(1);
    boolean mutation_bool=false;
    if (mut<=mutation)
    {
      mutation_bool=true;
    }
    for (int i=0; i<weights.length; i++)
    {
      if (mutation_bool && i==mutation_index)
      {
        to.weights[i]=random(-1, 1);
      } else
      {
        to.weights[i]=weights[i];
      }
    }
  }
  float activation_func(float in)
  {
    float a=5;
    if (abs(in)<5.0/a)
    {
      return (exp(a*in)-1.0)/(1.0+exp(a*in));
    } else if (in>0)
    {
      return 1;
    } else 
    {
      return -1;
    }
  }
}
float signum(float in)
{
  if (in>0)
  {
    return 1;
  } else
  {
    return -1;
  }
}
