class Tetrahedron
{
  PVector center;
  float len;
  Tetrahedron(PVector pos, float len_)
  {
    center=new PVector(pos.x, pos.y, pos.z);
    len=len_;
    PVector A=new PVector(0, -len/sqrt(3), -len/(2.0*sqrt(6)));
    PVector B=new PVector((-len/sqrt(3))*sin(TWO_PI/3.0), (-len/sqrt(3))*cos(TWO_PI/3.0), -len/(2.0*sqrt(6)));
    PVector C=new PVector((-len/sqrt(3))*sin(-TWO_PI/3.0), (-len/sqrt(3))*cos(-TWO_PI/3.0), -len/(2.0*sqrt(6)));
    PVector D=new PVector(0, 0, 0.5*len*sqrt(3.0/2.0));
    points.add(A);
    points.add(B);
    points.add(C);
    points.add(D);
  }
  void show()
  {
    //pushMatrix();
    //translate(center.x, center.y, center.z);
    PVector A=new PVector(0, -len/sqrt(3), -len/(2.0*sqrt(6)));
    PVector B=new PVector((-len/sqrt(3))*sin(TWO_PI/3.0), (-len/sqrt(3))*cos(TWO_PI/3.0), -len/(2.0*sqrt(6)));
    PVector C=new PVector((-len/sqrt(3))*sin(-TWO_PI/3.0), (-len/sqrt(3))*cos(-TWO_PI/3.0), -len/(2.0*sqrt(6)));
    PVector D=new PVector(0, 0, 0.5*len*sqrt(3.0/2.0));
    stroke(255, 0, 0);
    strokeWeight(10);
    point(A.x, A.y, A.z);
    point(B.x, B.y, B.z);
    point(C.x, C.y, C.z);
    point(D.x, D.y, D.z);
    //fill(255, 100, 100);
    ////stroke(255);
    //noStroke();
    ////noFill();
    //beginShape();
    //vertex(A.x, A.y, A.z);
    //vertex(B.x, B.y, B.z);
    //vertex(C.x, C.y, C.z);
    //vertex(A.x, A.y, A.z);
    //endShape();
    //beginShape();
    //vertex(B.x, B.y, B.z);
    //vertex(C.x, C.y, C.z);
    //vertex(D.x, D.y, D.z);
    //vertex(B.x, B.y, B.z);
    //endShape();
    //beginShape();
    //vertex(A.x, A.y, A.z);
    //vertex(C.x, C.y, C.z);
    //vertex(D.x, D.y, D.z);
    //vertex(A.x, A.y, A.z);
    //endShape();
    //beginShape();
    //vertex(A.x, A.y, A.z);
    //vertex(B.x, B.y, B.z);
    //vertex(D.x, D.y, D.z);
    //vertex(A.x, A.y, A.z);
    //endShape();
    //popMatrix();
  }
  //ArrayList<Tetrahedron> make_child()
  //{
  //  //PVector A=new PVector(0, -len/sqrt(3), -len/(2.0*sqrt(6)));
  //  //PVector B=new PVector((-len/sqrt(3))*sin(TWO_PI/3.0), (-len/sqrt(3))*cos(TWO_PI/3.0), -len/(2.0*sqrt(6)));
  //  //PVector C=new PVector((-len/sqrt(3))*sin(-TWO_PI/3.0), (-len/sqrt(3))*cos(-TWO_PI/3.0), -len/(2.0*sqrt(6)));
  //  //PVector D=new PVector(0, 0, 0.5*len*sqrt(3.0/2.0));
  //  //A.setMag(A.mag()/2.0);
  //  //A.add(center);
  //  //B.setMag(B.mag()/2.0);
  //  //B.add(center);
  //  //C.setMag(C.mag()/2.0);
  //  //C.add(center);    
  //  //D.setMag(D.mag()/2.0);
  //  //D.add(center);    
  //  //ArrayList<Tetrahedron> temp=new ArrayList<Tetrahedron>();
  //  //Tetrahedron A_n=new Tetrahedron();
  //  //float p=1;
  //  //A_n.ini(A, p*len/2.0);
  //  //temp.add(A_n);
  //  //A_n=new Tetrahedron();
  //  f//A_n.ini(B, p*len/2.0);
  //  //temp.add(A_n);
  //  //A_n=new Tetrahedron();
  //  //A_n.ini(C, p*len/2.0);
  //  //temp.add(A_n);
  //  //A_n=new Tetrahedron();
  //  //A_n.ini(D, p*len/2.0);
  //  //temp.add(A_n);
  //  //A_n=new Tetrahedron();
  //  //return temp;
  //}
}
