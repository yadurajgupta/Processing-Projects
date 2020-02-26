class Node
{
  float weights[];
  float inputs[];
  float output;
  Node(int weigthsnum)
  {
    weights=new float[weigthsnum];
  }
  float out(float inp[])
  {
    float ans=0;
    for(int i=0;i<weights.length;i++)
    {
      ans+=weights[i]*inp[i];
    }
    return ans;
  }
}
