class Reg
{
  DataSet D=new DataSet();
  Line L=new Line(0, 0);
  Reg(DataSet D_)
  {
    D=new DataSet();
    D.setData(D_);
  }
  void regress()
  {
    float mn=0;
    float md=0;
    for (int i=0; i<D.x.length; i++)
    {
      mn=mn+((D.x[i]-D.x_mean)*(D.y[i]-D.y_mean));
      md=mn+pow(D.x[i]-D.x_mean,2);
    }
    float m=(mn)/(md);
    float c=(D.y_mean)-(m*D.x_mean);
    L.update(m, c);
  }
  void show()
  {
    L.show();
    D.show();
  }
}
