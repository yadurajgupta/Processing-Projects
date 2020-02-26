//class Line
//{
//  PVector LineA=new PVector();
//  PVector LineB=new PVector();
//  float slope,intcp;
//  float y_const,x_const;
//  int type=0;
//  Line(PVector A_, PVector B_)
//  {
//    LineA.set(A_.x, A_.y);
//    LineB.set(B_.x, B_.y);
//    if((A_.x-B_.x)!=0 && (A_.y-B_.y)!=0)
//    {
//      setval();
//    }
//    else if(A_.x-B_.x==0)
//    {
//      type=1;
//    }
//    else
//    {
//      type=2;
//    }
//  }
//  void setval()
//  {
//    slope=(LineA.y-LineB.y)/(LineA.x-LineB.x);
//    intcp=LineA.y-slope*LineA.x;
//  }
//  PVector intersect(Line L)
//  {
//    if (this.para(L))
//    {
//      return new PVector(2*width, 2*height);
//    } else
//    {
//      float tempx=0, tempy=0;
//      if (x_coef==0)
//      {
//        tempy=coef/y_coef;
//        tempx=L.coef-L.y_coef*(tempy);
//      } else if (L.x_coef==0)
//      {
//        tempy=L.coef/L.y_coef;
//        tempx=coef-y_coef*tempy;
//      } else
//      {
//        float m1, m2, i1, i2;
//        m1=y_coef/x_coef;
//        m2=L.y_coef/L.x_coef;
//        i1=LineA.y-m1*LineA.x;
//        i2=L.LineA.y-m2*L.LineA.x;
//        tempx=(i2-i1)/(m1-m2);
//        tempy=(m1*i2-m2*i1)/(m1-m2);
//      }
//      return new PVector(tempx,tempy);
//    }
//  }
//  float givey(float x_)
//  {
//    if (y_coef==0)
//      return (coef-x_coef*x_)*height;
//    else
//      return (coef-x_coef*x_)/y_coef;
//  }
//  void show()
//  {
//    colorMode(RGB);
//    stroke(255, 0, 255);
//    strokeWeight(20);
//    if(y_coef==0)
//    {
//      //line();
//    }
//    if(x_coef==0)
//    {
//    }
//    else
//    {
//    }
//  }
//  boolean para(Line L)
//  {
//    if (x_coef==0 || L.x_coef==0)
//    {
//      if (x_coef==0 && L.x_coef==0)
//      {
//        return true;
//      } else
//      {
//        return false;
//      }
//    }
//    if (y_coef==0 || L.y_coef==0)
//    {
//      if (y_coef==0 && L.y_coef==0)
//      {
//        return true;
//      } else
//      {
//        return false;
//      }
//    }
//    if (x_coef/y_coef==L.x_coef/L.y_coef)
//    {
//      return true;
//    } else
//    {
//      return false;
//    }
//  }
//}
