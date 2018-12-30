void merge_sort_start(ArrayList<Point> A, ArrayList<Point> B)
{
  copyPoints(A, B, 0, A.size());
  merge_sort_split(A, B, 0, A.size());
}
void copyPoints(ArrayList<Point> A, ArrayList<Point> B, int start, int end)
{
  for (int i=start; i<end; i++)
  {
    B.get(i).setPoint(A.get(i));
  }
}
void merge_sort_split(ArrayList<Point> A, ArrayList<Point> B, int start, int end)
{
  if (end-start<2)
  {
  } else
  {
    int mid=(end+start)/2;
    merge_sort_split(A, B, start, mid);
    merge_sort_split(A, B, mid, end);
    merge_sort_put(A, B, start, mid, end);
  }
}
void merge_sort_put(ArrayList<Point> A, ArrayList<Point> B, int start, int mid, int end)
{
  int i=start;
  int j=mid;
  int k=start;
  while (i<mid && j<end)
  {
    if (floor(A.get(i).getx())<floor(A.get(j).getx()))
    {
      B.get(k).setPoint(A.get(i));
      i++;
      k++;
    } else
    {
      B.get(k).setPoint(A.get(j));
      j++;
      k++;
    }
  }
  while (i<mid)
  {
    B.get(k).setPoint(A.get(i));
    i++;
    k++;
  }
  while (j<end)
  {
    B.get(k).setPoint(A.get(j));
    j++;
    k++;
  }
  copyPoints(B, A, start, end);
}
