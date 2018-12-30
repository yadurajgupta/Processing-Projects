void merge_sort_startp(ArrayList<Circle> A)
{
  ArrayList<Circle> B=new ArrayList<Circle>();
  for (Circle P : A)
  {
    B.add(new Circle());
  }
  copyPointsp(A, B, 0, A.size());
  merge_sort_splitp(A, B, 0, A.size());
}
void copyPointsp(ArrayList<Circle> A, ArrayList<Circle> B, int start, int end)
{
  for (int i=start; i<end; i++)
  {
    B.get(i).setCir(A.get(i));
  }
}
void merge_sort_splitp(ArrayList<Circle> A, ArrayList<Circle> B, int start, int end)
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
void merge_sort_putp(ArrayList<Circle> A, ArrayList<Circle> B, int start, int mid, int end)
{
  int i=start;
  int j=mid;
  int k=start;
  while (i<mid && j<end)
  {
    if (round(A.get(i).pos.x)<round(A.get(j).pos.x))
    {
      B.get(k).setCir(A.get(i));
      i++;
      k++;
    } else if (round(A.get(i).pos.x) == round(A.get(j).pos.x))
    {
      if (round(A.get(i).pos.y)<=round(A.get(j).pos.y))
      {
        B.get(k).setCir(A.get(i));
        i++;
        k++;
      } else
      {
        B.get(k).setCir(A.get(j));
        j++;
        k++;
      }
    } else
    {
      B.get(k).setCir(A.get(j));
      j++;
      k++;
    }
  }
  while (i<mid)
  {
    B.get(k).setCir(A.get(i));
    i++;
    k++;
  }
  while (j<end)
  {
    B.get(k).setCir(A.get(j));
    j++;
    k++;
  }
  copyPointsp(B, A, start, end);
}
