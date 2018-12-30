class DataSet
{
  float []x;
  float []y;
  float x_mean=0;
  float y_mean=0;
  DataSet()
  {
    x=null;
    y=null;
  }
  DataSet(float[] x_, float[] y_)
  {
    x=new float[x_.length];
    y=new float[y_.length];
    for (int i=0; i<x_.length; i++)
    {
      x[i]=x_[i];
      y[i]=y_[i];
    }
  }
  void setData(DataSet D)
  {
    x=new float[D.x.length];
    y=new float[D.y.length];
    for (int i=0; i<D.x.length; i++)
    {
      x[i]=D.x[i];
      y[i]=D.y[i];
    }
    x_mean=D.x_mean;
    y_mean=D.y_mean;
  }
  void setmean()
  {
    int len=x.length;
    x_mean=0;
    y_mean=0;
    for (int i=0; i<len; i++)
    {
      x_mean+=x[i];
    }
    x_mean=x_mean/((float) len);
    for (int i=0; i<len; i++)
    {
      y_mean+=(y[i]);
    }
    y_mean=y_mean/((float) len);
  }
  void show()
  {
    strokeWeight(2);
    stroke(255);
    for (int i=0; i<x.length; i++)
    {
      point(x[i], y[i]);
    }
  }
}
