abstract class Object
{
  abstract void updateAABB();
  abstract void update();
  abstract void display();
};

class Cuboid extends Object
{
  AABB aabb = new AABB();
  RotatedAABB cuboid = new RotatedAABB();
  PImage t1;
  PImage t2;
  PImage t3;
  PImage t4;
  PImage t5;
  PImage t6;
  float d1 = 1; // front x*y
  float d2 = 1; // back x*y
  float d3 = 1; // bottom x*z
  float d4 = 1; // top x*z
  float d5 = 1; // right z*y
  float d6 = 1; // left z*y
  Cuboid(){}
  Cuboid(RotatedAABB a){
    cuboid.p = a.p.copy();
    cuboid.r = a.r.copy();
    cuboid.a = a.a.copy();
  }
  void setText(String n1, String n2, String n3, String n4, String n5, String n6, color c1, color c2){
    setTextGraphicsSize((int)(cuboid.r.x*textResolution), (int)(cuboid.r.y*textResolution));
    writeText(n1, c1, c2, 0.5f, 0.5f);
    t1 = textGraphics.get();
    setTextGraphicsSize((int)(cuboid.r.x*textResolution), (int)(cuboid.r.y*textResolution));
    writeText(n2, c1, c2, 0.5f, 0.5f);
    t2 = textGraphics.get();
    setTextGraphicsSize((int)(cuboid.r.z*textResolution), (int)(cuboid.r.x*textResolution));
    writeText(n3, c1, c2, 0.5f, 0.5f);
    t3 = textGraphics.get();
    setTextGraphicsSize((int)(cuboid.r.z*textResolution), (int)(cuboid.r.x*textResolution));
    writeText(n4, c1, c2, 0.5f, 0.5f);
    t4 = textGraphics.get();
    setTextGraphicsSize((int)(cuboid.r.z*textResolution), (int)(cuboid.r.y*textResolution));
    writeText(n5, c1, c2, 0.5f, 0.5f);
    t5 = textGraphics.get();
    setTextGraphicsSize((int)(cuboid.r.z*textResolution), (int)(cuboid.r.y*textResolution));
    writeText(n6, c1, c2, 0.5f, 0.5f);
    t6 = textGraphics.get();
  }
  void setText(String n1,color c1, color c2){
    setText(n1,n1,n1,n1,n1,n1,c1,c2);
  }
  void setTexture(PImage a){
    t1 = a;
    t2 = a;
    t3 = a;
    t4 = a;
    t5 = a;
    t6 = a;
  }
  void setUV(float a){
    d1 = a;
    d2 = a;
    d3 = a;
    d4 = a;
    d5 = a;
    d6 = a;
  }
  void updateAABB(){}
  void update(){}
  void display(){
    noStroke();
    pushMatrix();
    translate(cuboid.p.x, cuboid.p.y, cuboid.p.z);
    scale(cuboid.r.x, cuboid.r.y, cuboid.r.z);
    rotateX(cuboid.a.x);
    rotateY(cuboid.a.y);
    rotateZ(cuboid.a.z);
    beginShape();
    texture(t1);
    vertex(-1, -1,  1, 0, 0);
    vertex( 1, -1,  1, d1, 0);
    vertex( 1,  1,  1, d1, d1);
    vertex(-1,  1,  1, 0, d1);
    endShape();
    beginShape();
    texture(t2);
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, d2, 0);
    vertex(-1,  1, -1, d2, d2);
    vertex( 1,  1, -1, 0, d2);
    endShape();
    beginShape();
    texture(t3);
    vertex(-1,  1,  1, 0, 0);
    vertex( 1,  1,  1, d3, 0);
    vertex( 1,  1, -1, d3, d3);
    vertex(-1,  1, -1, 0, d3);
    endShape();
    beginShape();
    texture(t4);
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, d4, 0);
    vertex( 1, -1,  1, d4, d4);
    vertex(-1, -1,  1, 0, d4);
    endShape();
    beginShape();
    texture(t5);
    vertex( 1, -1,  1, 0, 0);
    vertex( 1, -1, -1, d5, 0);
    vertex( 1,  1, -1, d5, d5);
    vertex( 1,  1,  1, 0, d5);
    endShape();
    beginShape();
    texture(t6);
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1,  1, d6, 0);
    vertex(-1,  1,  1, d6, d6);
    vertex(-1,  1, -1, 0, d6);
    endShape();
    popMatrix();
  }
};
