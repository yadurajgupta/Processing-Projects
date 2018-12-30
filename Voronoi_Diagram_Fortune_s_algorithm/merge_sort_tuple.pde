void merge_sort_startt(ArrayList<Tuple> A, ArrayList<Tuple> B)
{
  copyPointst(A, B, 0, A.size());
  merge_sort_splitt(A, B, 0, A.size());
}
void copyPointst(ArrayList<Tuple> A, ArrayList<Tuple> B, int start, int end)
{
  for (int i=start; i<end; i++)
  {
    B.get(i).setTo(A.get(i));
  }
}
void merge_sort_splitt(ArrayList<Tuple> A, ArrayList<Tuple> B, int start, int end)
{
  if (end-start<2)
  {
  } else
  {
    int mid=(end+start)/2;
    merge_sort_splitt(A, B, start, mid);
    merge_sort_splitt(A, B, mid, end);
    merge_sort_putt(A, B, start, mid, end);
  }
}
void merge_sort_putt(ArrayList<Tuple> A, ArrayList<Tuple> B, int start, int mid, int end)
{
  int i=start;
  int j=mid;
  int k=start;
  while (i<mid && j<end)
  {
    if (A.get(i).lessthan(A.get(j)) || A.get(i).checkequal(A.get(j)))
    {
      B.get(k).setTo(A.get(i));
      i++;
      k++;
    } else
    {
      B.get(k).setTo(A.get(j));
      j++;
      k++;
    }
  }
  while (i<mid)
  {
    B.get(k).setTo(A.get(i));
    i++;
    k++;
  }
  while (j<end)
  {
    B.get(k).setTo(A.get(j));
    j++;
    k++;
  }
  copyPointst(B, A, start, end);
}
