import peasy.*;



float a;
float b;
float c;
float theta;
float phi;
float n;
PeasyCam camera;
float step=PI/20.0;
float size=50.0;
void setup()
{
  size(550, 550, P3D);
  background(0);
  camera=new PeasyCam(this, size);
  a=random(size/10.0, ((size/2.0)*(0.95))/2.0);
  b=random(size/10.0, ((size/2.0)*(0.95))/2.0);
  c=random(a, b);
  n=random(2, 4);
  theta=0;
  phi=0;
}
void draw()
{
  //background(0);
  frameRate(1);
  //lights();
  background(0);
  theta=0;
  stroke(255);
  strokeWeight(2);
  line(0, 0, 0, 100, 0, 0);
  line(0, 0, 0, 0, 100, 0);  
  line(0, 0, 0, 0, 0, 100);
  while (theta<(PI/2.0))
  {
    phi=0;
    while (phi<(PI/2.0))
    {
      float xs=a*pow(abs((sin(theta)*cos(phi))), 2.0/n);
      float ys=b*pow(abs((sin(theta)*sin(phi))), 2.0/n);
      float zs=c*pow(abs((cos(theta))), 2.0/n);
      float xps=a*pow(abs((sin(theta)*cos(phi+step))), 2.0/n);
      float yps=b*pow(abs((sin(theta)*sin(phi+step))), 2.0/n);
      float zps=c*pow(abs((cos(theta))), 2.0/n);
      float xts=a*pow(abs((sin(theta+step)*cos(phi))), 2.0/n);
      float yts=b*pow(abs((sin(theta+step)*sin(phi))), 2.0/n);
      float zts=c*pow(abs((cos(theta+step))), 2.0/n);
      float xtps=a*pow(abs((sin(theta+step)*cos(phi+step))), 2.0/n);
      float ytps=b*pow(abs((sin(theta+step)*sin(phi+step))), 2.0/n);
      float ztps=c*pow(abs((cos(theta+step))), 2.0/n);
      float x, y, z, xp, yp, zp, xt, yt, zt, xtp, ytp, ztp;
      //tint(255, 127);
      fill(((xs+ys+zs)%(255.0))*(255.0/(size)));
      float scale=1.0;
      float scale1=10.0;
      //x+ y+ z+
      x=xs*(1+(noise(xs/scale1, theta/scale1, phi/scale1)/scale));
      y=ys*(1+(noise(ys/scale1, theta/scale1, phi)/scale/scale1));
      z=zs*(1+(noise(zs/scale1, theta/scale1, phi/scale1)/scale));

      xt=xts*(1+(noise(xts/scale1, theta/scale1, phi/scale1)/scale));
      yt=yts*(1+(noise(yts/scale1, theta/scale1, phi/scale1)/scale));
      zt=zts*(1+(noise(zts/scale1, theta/scale1, phi/scale1)/scale)); 

      xtp=xtps*(1+(noise(xtps/scale1, theta/scale1, phi/scale1)/scale));
      ytp=ytps*(1+(noise(ytps/scale1, theta/scale1, phi/scale1)/scale));
      ztp=ztps*(1+(noise(ztps/scale1, theta/scale1, phi/scale1)/scale)); 

      xp=xps*(1+(noise(xps/scale1, theta/scale1, phi/scale1)/scale));
      yp=yps*(1+(noise(xps/scale1, theta/scale1, phi/scale1)/scale));
      zp=zps*(1+(noise(xps/scale1, theta/scale1, phi/scale1)/scale));      
      stroke(0);
      strokeWeight(0.5);
      beginShape();
      vertex(xs, ys, zs);
      vertex(xts, yts, zts);
      vertex(xps, yps, zps);
      endShape();
      // point(xtp, ytp, ztp);
      //// vertex(x, y, z);
      // endShape();
      beginShape();
      vertex(xps, yps, zps);
      vertex(xtps, ytps, ztps);
      vertex(xts, yts, zts);
      //// vertex(xp, yp, zp);
      endShape();
      ////x- y+ z+
      //x=-xs*(1+(noise(xs,theta,phi)/scale));
      //y=ys*(1+(noise(ys,theta,phi)/scale));
      //z=zs*(1+(noise(zs,theta,phi)/scale));

      //xt=-xts*(1+(noise(xts,theta,phi)/scale));
      //yt=yts*(1+(noise(yts,theta,phi)/scale));
      //zt=zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=-xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=-xps*(1+(noise(xps,theta,phi)/scale));
      //yp=yps*(1+(noise(xps,theta,phi)/scale));
      //zp=zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape(); 
      ////x+ y- z+
      //x=xs*(1+(noise(xs,theta,phi)/scale));
      //y=-ys*(1+(noise(ys,theta,phi)/scale));
      //z=zs*(1+(noise(zs,theta,phi)/scale));

      //xt=xts*(1+(noise(xts,theta,phi)/scale));
      //yt=-yts*(1+(noise(yts,theta,phi)/scale));
      //zt=zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=-ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=xps*(1+(noise(xps,theta,phi)/scale));
      //yp=-yps*(1+(noise(xps,theta,phi)/scale));
      //zp=zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape(); 
      ////x+ y+ z-
      //x=xs*(1+(noise(xs,theta,phi)/scale));
      //y=ys*(1+(noise(ys,theta,phi)/scale));
      //z=-zs*(1+(noise(zs,theta,phi)/scale));

      //xt=xts*(1+(noise(xts,theta,phi)/scale));
      //yt=yts*(1+(noise(yts,theta,phi)/scale));
      //zt=-zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=-ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=xps*(1+(noise(xps,theta,phi)/scale));
      //yp=yps*(1+(noise(xps,theta,phi)/scale));
      //zp=-zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape(); 
      ////x+ y- z-
      //x=xs*(1+(noise(xs,theta,phi)/scale));
      //y=-ys*(1+(noise(ys,theta,phi)/scale));
      //z=-zs*(1+(noise(zs,theta,phi)/scale));

      //xt=xts*(1+(noise(xts,theta,phi)/scale));
      //yt=-yts*(1+(noise(yts,theta,phi)/scale));
      //zt=-zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=-ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=-ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=xps*(1+(noise(xps,theta,phi)/scale));
      //yp=-yps*(1+(noise(xps,theta,phi)/scale));
      //zp=-zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape(); 
      ////x- y+ z-
      //x=-xs*(1+(noise(xs,theta,phi)/scale));
      //y=ys*(1+(noise(ys,theta,phi)/scale));
      //z=-zs*(1+(noise(zs,theta,phi)/scale));

      //xt=-xts*(1+(noise(xts,theta,phi)/scale));
      //yt=yts*(1+(noise(yts,theta,phi)/scale));
      //zt=-zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=-xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=-ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=-xps*(1+(noise(xps,theta,phi)/scale));
      //yp=yps*(1+(noise(xps,theta,phi)/scale));
      //zp=-zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape();  
      ////x- y- z+
      //x=-xs*(1+(noise(xs,theta,phi)/scale));
      //y=-ys*(1+(noise(ys,theta,phi)/scale));
      //z=zs*(1+(noise(zs,theta,phi)/scale));

      //xt=-xts*(1+(noise(xts,theta,phi)/scale));
      //yt=-yts*(1+(noise(yts,theta,phi)/scale));
      //zt=zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=-xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=-ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=-xps*(1+(noise(xps,theta,phi)/scale));
      //yp=-yps*(1+(noise(xps,theta,phi)/scale));
      //zp=zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape();  
      ////x- y- z-
      //x=-xs*(1+(noise(xs,theta,phi)/scale));
      //y=-ys*(1+(noise(ys,theta,phi)/scale));
      //z=-zs*(1+(noise(zs,theta,phi)/scale));

      //xt=-xts*(1+(noise(xts,theta,phi)/scale));
      //yt=-yts*(1+(noise(yts,theta,phi)/scale));
      //zt=-zts*(1+(noise(zts,theta,phi)/scale)); 

      //xtp=-xtps*(1+(noise(xtps,theta,phi)/scale));
      //ytp=-ytps*(1+(noise(ytps,theta,phi)/scale));
      //ztp=-ztps*(1+(noise(ztps,theta,phi)/scale)); 

      //xp=-xps*(1+(noise(xps,theta,phi)/scale));
      //yp=-yps*(1+(noise(xps,theta,phi)/scale));
      //zp=-zps*(1+(noise(xps,theta,phi)/scale));      

      //beginShape();
      //vertex(x, y, z);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //vertex(x, y, z);
      //endShape();
      //beginShape();
      //vertex(xp, yp, zp);
      //vertex(xtp, ytp, ztp);
      //vertex(xt, yt, zt);
      //vertex(xp, yp, zp);
      //endShape();
      phi+=step;
    }
    theta+=step;
  }
  //noLoop();
}
