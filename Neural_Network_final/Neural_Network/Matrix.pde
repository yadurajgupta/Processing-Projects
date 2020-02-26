class Matrix
{
  int [][] arr;
  int M, N;
  Matrix(int M_, int N_)
  {
    M=M_;
    N=N_;
    arr=new int[M][N];
    clearMat();
  }
  Matrix(int [][]arr_)
  {
    arr=arr_;
    M=arr.length;
    N=arr[0].length;
  }
  void clearMat()
  {
    for (int i=0; i<M; i++)
    {
      for (int j=0; j<N; j++)
      {
        arr[i][j]=0;
      }
    }
  }
  void show()
  {
    for (int i=0; i<M; i++)
    {
      for (int j=0; j<N; j++)
      {
        print(arr[i][j]+" ");
      }
      println();
    }
    println();
  }
}
Matrix multiply(Matrix A, Matrix B)
{
  Matrix C=new Matrix(A.M, B.N);
  //A.M*B.N threads
  //i=threadcount/B.N;
  //j=threadcount%B.N;
  //B.M==A.N
  //A.N || B.M threadblocks k
  //C[i][j]=A[i][k]*B[k][j];
  for (int i=0; i<A.M; i++)
  {
    for (int j=0; j<B.N; j++)
    {
      for (int k=0; k<B.M; k++)
      {
        C.arr[i][j]+=A.arr[i][k]*B.arr[k][j];
      }
    }
  }
  return C;
}
