Network net;
int[] networksize={15,15,3};
float mutation_rate=0.01;
void setup()
{
  size(800,800);
  net =new Network(networksize,3,mutation_rate);
  int [][] arr1=new int[3][2];
  int [][] arr2=new int[2][3];
  for(int i=0;i<3;i++)
  {
    for(int j=0;j<2;j++)
    {
      arr1[i][j]=(int)floor(random(5));
    }
  }
  for(int i=0;i<2;i++)
  {
    for(int j=0;j<3;j++)
    {
      arr2[i][j]=(int)floor(random(5));
    }
  }
  Matrix A=new Matrix(arr1);
  Matrix B=new Matrix(arr2);
  Matrix C=multiply(A,B);
  A.show();
  B.show();
  C.show();
}
void draw()
{
  
}
