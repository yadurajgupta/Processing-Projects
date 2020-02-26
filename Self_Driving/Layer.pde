class Layer
{
  Node[] nodes;
  Layer(int size, int inputsize)
  {
    nodes=new Node[size];
    for (int i=0; i<size; i++)
    {
      nodes[i]=new Node(inputsize);
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
