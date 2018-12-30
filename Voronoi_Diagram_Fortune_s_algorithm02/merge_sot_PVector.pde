void merge_sort_startp(ArrayList<PVector> A)
{
  ArrayList<PVector> B=new ArrayList<PVector>();
  for (PVector P : A)
  {
    B.add(new PVector());
  }
  copyPointsp(A, B, 0, A.size());
  merge_sort_splitp(A, B, 0, A.size());
}
void copyPointsp(ArrayList<PVector> A, ArrayList<PVector> B, int start, int end)
{
  for (int i=start; i<end; i++)
  {
    B.get(i).set(A.get(i));
  }
}
void merge_sort_splitp(ArrayList<PVector> A, ArrayList<PVector> B, int start, int end)
{
  if (end-start<2)
  {
  } else
  {
    int mid=(end+start)/2;
    merge_sort_splitp(A, B, start, mid);
    merge_sort_splitp(A, B, mid, end);
    merge_sort_putp(A, B, start, mid, end);
  }
}
void merge_sort_putp(ArrayList<PVector> A, ArrayList<PVector> B, int start, int mid, int end)
{
  int i=start;
  int j=mid;
  int k=start;
  while (i<mid && j<end)
  {
    if (round(A.get(i).x)<round(A.get(j).x))
    {
      B.get(k).set(A.get(i));
      i++;
      k++;
    } else if (round(A.get(i).x) == round(A.get(j).x))
    {
      if (round(A.get(i).y)<=round(A.get(j).y))
      {
        B.get(k).set(A.get(i));
        i++;
        k++;
      } else
      {
        B.get(k).set(A.get(j));
        j++;
        k++;
      }
    } else
    {
      B.get(k).set(A.get(j));
      j++;
      k++;
    }
  }
  while (i<mid)
  {
    B.get(k).set(A.get(i));
    i++;
    k++;
  }
  while (j<end)
  {
    B.get(k).set(A.get(j));
    j++;
    k++;
  }
  copyPointsp(B, A, start, end);
}
