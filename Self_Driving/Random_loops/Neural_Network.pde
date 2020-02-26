class Network
{
  Layer[] layers;
  int []networkSize;
  int inputs;
  int inputSize;
  float mutation;
  Network(int size[], int input, float mut)
  {
    mutation=mut;
    networkSize=size;
    inputs=input;
    layers=new Layer[size.length];
    inputSize=input;
    for (int i=0; i<size.length; i++)
    {
      if (i==0)
      {
        layers[i]=new Layer(size[i], input+1, mutation);
      } else
      {
        layers[i]=new Layer(size[i], size[i-1]+1, mutation);
      }
    }
  }
  float[] output(float[] input)
  {
    float out[]=new float[1];
    for (int i=0; i<layers.length; i++)
    {
      out=layers[i].output(input);
      input=out;
    }
    return out;
  }
  void mate(Network Parent1, Network Parent2)
  {
    int seperation=(int)random(0, layers.length);
    for (int i=0; i<seperation; i++)
    {
      Parent1.layers[i].copy(layers[i]);
    }
    for (int i=seperation; i<layers.length; i++)
    {
      Parent2.layers[i].copy(layers[i]);
    }
  }
  Network copy()
  {
    Network n=new Network(networkSize, inputs, mutation);
    for (int i=0; i<n.layers.length; i++)
    {
      this.layers[i].copy(n.layers[i]);
    }
    return n;
  }
  Network mutate()
  {
    Network n=this.copy();
    for (int i=0; i<n.layers.length; i++)
    {
      for (int j=0; j<layers[i].size; j++)
      {
        for (int k=0; k<layers[i].nodes[j].size; k++)
        {
          float ran=random(1);
          if (ran<mutation)
            layers[i].nodes[j].weights[k]=random(1);
        }
      }
    }
    return n;
  }
}
