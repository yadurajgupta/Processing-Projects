class Layer
{
  Node[] nodes;
  int input;
  float mutation;
  int size;
  Layer(int size_, int inputsize, float mut)
  {
    input=inputsize;
    mutation=mut;
    nodes=new Node[size_];
    size=size_;
    for (int i=0; i<size; i++)
    {
      nodes[i]=new Node(input, mutation);
    }
  }
  float[] output(float [] input)
  {
    float out[]=new float[nodes.length];
    for (int i=0; i<nodes.length; i++)
    {
      out[i]=nodes[i].output(input);
    }
    return out;
  }
  void copy(Layer L)
  {
    for (int i=0; i<L.nodes.length; i++)
    {
      nodes[i].copy(L.nodes[i]);
    }
  }
}
