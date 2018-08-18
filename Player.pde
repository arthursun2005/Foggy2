void Cuboid(PImage tex, float d) {
  beginShape(QUADS);
  texture(tex);
  
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, d, 0);
  vertex( 1,  1,  1, d, d);
  vertex(-1,  1,  1, 0, d);
  
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, d, 0);
  vertex(-1,  1, -1, d, d);
  vertex( 1,  1, -1, 0, d);
  
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, d, 0);
  vertex( 1,  1, -1, d, d);
  vertex(-1,  1, -1, 0, d);
  
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, d, 0);
  vertex( 1, -1,  1, d, d);
  vertex(-1, -1,  1, 0, d);
  
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, d, 0);
  vertex( 1,  1, -1, d, d);
  vertex( 1,  1,  1, 0, d);
  
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, d, 0);
  vertex(-1,  1,  1, d, d);
  vertex(-1,  1, -1, 0, d);
  
  endShape();
}
class Player
{
  PVector scale = new PVector(30, 30, 30);
  PVector rot = new PVector();
  PVector pos = new PVector();
  PVector vel = new PVector();
  PImage texture = null;
  Player(){}
  void update(){
    vel.mult(0.88f);
    pos.add(vel);
  }
  void display(){
    noStroke();
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);
    scale(scale.x, scale.y, scale.z);
    translate(pos.x, pos.y, pos.z);    
    Cuboid(texture, 2);
    translate(-pos.x, -pos.y, -pos.z);
    scale(1/scale.x, 1/scale.y, 1/scale.z);
    rotateX(-rot.x);
    rotateY(-rot.y);
    rotateZ(-rot.z);
  }
};
