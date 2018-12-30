import processing.serial.*;
int[] A;
int[] B;
int i;
boolean first=true;
void setup()
{
  fullScreen();
  //size(100, 100);
  background(0);
  A=new int[width];
  B=new int[width];
  for (i=0; i<width; i++)
  {
    A[i]=floor((random(height)));
    B[i]=A[i];
  }
}
void draw()
{
  background(0);
  stroke(255);
  for (i=0; i<width; i++)
  {
    line(i, height, i, height-A[i]);
  }
  if (first)
  {
    merge_start(A, B, 0, width);
    first=false;
  }
}

void merge_put(int[] A, int[] B, int start, int mid, int end)
{
  int j=mid;
  int k=start;
  i=start;
  while (i<mid && j<end)
  {
    if (A[i]>A[j])
    {
      B[k]=A[j];
      j++;
      k++;
    } else
    {
      B[k]=A[i];
      i++;
      k++;
    }
  }
  while (i<mid)
  {
    B[k]=A[i];
    i++;
    k++;
  }
  while (j<end)
  {
    B[k]=A[j];
    j++;
    k++;
  }
  merge_copy(B, A, start, end-1);
}


void merge_copy(int[] A, int[] B, int start, int end)
{
  for (i=start; i<=end; i++)
  {
    B[i]=A[i];
  }
   // delay(100);
  redraw();
}


void merge_split(int[] A, int[] B, int start, int end)
{
  if (end-start<2)
  {
  } else
  {
    int mid=(start+end)/2;
    merge_split(A, B, start, mid);
    merge_split(A, B, mid, end);
    merge_put(A, B, start, mid, end);
  }
}


void merge_start(int[] A, int[] B, int start, int end)
{
  merge_copy(A, B, start, end-1);
  merge_split(A, B, start, end);
}
