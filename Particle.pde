int FIRE = 0;
int FOG = 1;
int WATER = 2;
int DUST = 3;
class Particle
{
  static final float FireDamping = 0.92f;
  static final float FogDamping = 0.88f;
  static final float WaterDamping = 1f;
  static final float DustDamping = 0.9f;
  static final float FireLift = 0.32f;
  static final float R = 10f;
  int life = 48;
  int age = 0;
  boolean gone = false;
  PVector p = new PVector();
  PVector v = new PVector();
  float r;
  color c;
  int type = FIRE;
  World god;
  Particle(){}
  Particle(int t){type = t;}
  Particle(int t, int l){type = t;life = l;}
  void update(){
    float d1 = map(age,life,0,64,255);
    float d2 = map(age,life,0,0,255);
    if(type == FIRE){
      v.y -= FireLift;
      v.mult(FireDamping);
    }else if(type == FOG){
      v.add(god.gravity);
      v.mult(FogDamping);
    }else if(type == WATER){
      v.add(god.gravity);
      v.mult(WaterDamping);
    }else{
      v.add(god.gravity);
      v.mult(DustDamping);
    }
    p.add(v);
    if(type == FIRE) c = color(255,d1,0,d2);
    else if(type == FOG) c = color(255,d2);
    else if(type == WATER) c = color(0,0,255/2f+d1/2f,d2);
    else c = color(120,80,20,d2);
    r = map(age*age,life*life,0,R/2f,R*2f);
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
