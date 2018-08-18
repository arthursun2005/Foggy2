interface Object
{
  void update();
  void display();
};

class World
{
  ArrayList<Particle> ps = new ArrayList<Particle>();
  ArrayList<Player> players = new ArrayList<Player>();
  int last = millis();
  int leftOvers = 0;
  int dt = 16;
  int maxits = 3;
  float ax = 0f;
  float ay = 0f;
  float az = 0f;
  float dx, dy, dz;
  PVector gravity = new PVector(0,0.2,0);
  Player you;
  World(){}
  void update(){
    int now = millis();
    int elapsed = now - last + leftOvers;
    elapsed = constrain(elapsed, 0, maxits*dt);
    int its = floor(float(elapsed)/float(dt));
    for(int i=0;i<its;i++){
      Step();
    }
    leftOvers = elapsed - its*dt;
    last = millis();
  }
  void Step(){
    for(int i=players.size()-1;i>=0;i--){
      Player p = players.get(i);
      p.update();
    }
    for(int i=ps.size()-1;i>=0;i--){
      Particle o = ps.get(i);
      if(o.age >= o.life){
        ps.remove(o);
        continue;
      }
      o.update();
    }
    float da = 0.01f;
    ax = constrain(ax, -PI/2f+da, PI/2f-da);
    float a = cos(ax);
    dx = a * sin(ay);
    dy = sin(ax);
    dz = -a * cos(ay);
    float v = 1.2f;
    float dd = 1200f;
    camera(you.pos.x+width/2f, you.pos.y+height/2f, you.pos.z, you.pos.x+dx+width/2f, you.pos.y+dy+height/2f, you.pos.z+dz, 0, 1, 0);
    if(mousePressed){
      ax -= (mouseY-pmouseY)/dd;
      ay -= (mouseX-pmouseX)/dd;
      if(mouseButton == RIGHT){
        you.vel.x += dx * v;
        you.vel.y += dy * v;
        you.vel.z += dz * v;
      }
    }
  }
  void display(){
    pushMatrix();
    translate(width/2f, height/2f);
    for(Player p : players){
      if(p == you) continue;
      p.display();
    }
    noLights();
    for(Particle o : ps){
      o.display();
    }
    popMatrix();
  }
};
