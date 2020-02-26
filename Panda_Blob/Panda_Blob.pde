int [][]arr;
boolean [][]visited;
int size;
import java.util.LinkedList; 
import java.util.Queue; 
void setup()
{
  fullScreen();
  //size(400, 400);
  size=5;
  arr=new int[width/size][height/size];
  visited=new boolean[width/size][height/size];
  arr_setup();
}
void draw()
{
  show();
}
void show()
{
  background(0);
  noStroke();
  for (int i=0; i<arr.length; i++)
  {
    for (int j=0; j<arr[i].length; j++)
    {
      if (arr[i][j]==0)
      {
        fill(255/2);
        rect(i*size, j*size, size, size);
      } else if (arr[i][j]==1)
      {
        fill(255);
        rect(i*size, j*size, size, size);
      } else
      {
        colorMode(HSB);
        fill(arr[i][j], 255, 255);
        rect(i*size, j*size, size, size);
      }
    }
  }
}
void keyPressed()
{
  if (key=='R'|| key=='r')
  {
    arr_setup();
  }
}
void circ(int x, int y, int r)
{
  x=x/size;
  y=y/size;
  r=r/size;
  for (int i=0; i<=r; i++)
  {
    for (int j=0; j<=r; j++)
    {
      if (i*i+j*j<r*r)
      {
        if (check(x+i, y+j))
          arr[x+i][y+j]=1;

        if (check(x-i, y-j))
          arr[x-i][y-j]=1;

        if (check(x+i, y-j))
          arr[x+i][y-j]=1;

        if (check(x-i, y+j))
          arr[x-i][y+j]=1;
      } else
      {
        break;
      }
    }
  }
}
boolean check(int x, int y)
{
  return x>=0 && x<arr.length && y>=0 && y<arr[0].length;
}
void mousePressed()
{
  bfs(mouseX/size, mouseY/size);
}
void bfs(int x, int y)
{
  Queue<PVector> que = new LinkedList<PVector>(); 
  int z=0;
  PVector p=new PVector(x, y, z);
  PVector curr=new PVector(x, y, z);
  que.add(p);
  while (que.size()!=0)
  {
    curr=que.peek();
    que.remove();
    x=floor(curr.x);
    y=floor(curr.y);
    z=floor(curr.z);
    for (int i=-1; i<2; i++)
    {
      for (int j=-1; j<2; j++)
      {
        if (check(x+i, y+j))
        {
          if (!visited[x+i][y+j] && arr[x+i][y+j]==1)
          {
            visited[x+i][y+j]=true;
            arr[x+i][y+j]=(z+2)%255;
            que.add(new PVector(x+i, y+j, (z+2)%255));
          }
        }
      }
    }
  }
}
void reset() {
  for (int i=0; i<visited.length; i++)
  {
    for (int j=0; j<visited[i].length; j++)
    {
      visited[i][j]=false;
    }
  }
}
void arr_setup()
{
  for (int i=0; i<arr.length; i++)
  {
    for (int j=0; j<arr[i].length; j++)
    {
      arr[i][j]=0;
      visited[i][j]=false;
    }
  }
  int num=floor(random(5, 10));
  for (int i=0; i<num; i++)
  {
    circ(floor(random(width)), floor(random(height)), floor(random(100, 200)));
  }
  reset();
}
