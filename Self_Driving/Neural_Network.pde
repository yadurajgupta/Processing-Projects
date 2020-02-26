class Network
{
  Layer[] layers;
  int inputSize;
  Network(int size[], int input)
  {
    layers=new Layer[size.length];
    inputSize=input;
    for (int i=0; i<size.length; i++)
    {
      if (i==0)
      {
        layers[i]=new Layer(size[i], input+1);
      } else
      {
        layers[i]=new Layer(size[i], size[i-1]+1);
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
    Network n=new Network(networkSize, inputs);
    for (int i=0; i<n.layers.length; i++)
    {
      this.layers[i].copy(n.layers[i]);
    }
    return n;
  }
}
