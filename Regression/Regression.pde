int linewidth=4;
int scale=1;
//void Preload()
//{

//}
float []x_vars;
float []y_vars;
int nump=1000;
DataSet Data;
Reg r;
void setup()
{
  fullScreen();
  background(0);
  x_vars=new float[nump];
  y_vars=new float[nump];
  for (int i=0; i<nump; i++)
  {
    x_vars[i]=random(-200, 200);
    y_vars[i]=random(-200, 200);
  }
  Data=new DataSet(x_vars, y_vars);
  Data.setmean();
  r=new Reg(Data);
}
void draw()
{
  background(0);
  translate(width/2,height/2);
  x_vars=new float[nump];
  y_vars=new float[nump];
  for (int i=0; i<nump; i++)
  {
    x_vars[i]=random(-200, 200);
    y_vars[i]=random(-200, 200);
  }
  Data=new DataSet(x_vars, y_vars);
  Data.setmean();
  r=new Reg(Data);
  r.regress();
  r.show();
}
