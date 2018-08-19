class Player
{
  PVector scale = new PVector(30, 30, 30);
  PVector rot = new PVector();
  PVector pos = new PVector();
  PVector vel = new PVector();
  PImage texture = null;
  color c = color(245);
  Player(){}
  void update(){
    vel.mult(0.88f);
    pos.add(vel);
  }
  void display(){
    noStroke();
    fill(c);
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);
    scale(scale.x, scale.y, scale.z);
    translate(pos.x, pos.y, pos.z);
    box(1);
    translate(-pos.x, -pos.y, -pos.z);
    scale(1/scale.x, 1/scale.y, 1/scale.z);
    rotateX(-rot.x);
    rotateY(-rot.y);
    rotateZ(-rot.z);
  }
};
