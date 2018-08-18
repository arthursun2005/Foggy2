int FIRE = 0;
int FOG = 1;
int WATER = 2;
class Particle
{
  int life = 48;
  int age = 0;
  boolean gone = false;
  PVector p = new PVector();
  PVector v = new PVector();
  static final float R = 10f;
  float r;
  color c;
  int type = FIRE;
  World god;
  Particle(){}
  Particle(int t){type = t;}
  void update(){
    float d1 = map(age,life,0,64,255);
    if(type == FIRE){
      v.y -= 0.2f;
      v.mult(0.92);
    }else if(type == FOG){
      v.add(god.gravity);
      v.mult(0.87);
    }else{
      v.add(god.gravity);
    }
    p.add(v);
    if(type == FIRE) c = color(255,d1,0,d1);
    else if(type == FOG) c = color(255,d1);
    else c = color(0,0,255/2f+d1/2f);
    r = type != WATER ? map(age*age,life*life,0,R/2f,R*2f) : r;
    age++;
  }
  void display(){
    fill(c);
    noStroke();
    translate(p.x, p.y, p.z);
    box(r);
    translate(-p.x, -p.y, -p.z);
  }
};
