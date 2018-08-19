void lighting(){
  directionalLight(235,255,205,-1,1,-0.5);
  directionalLight(255,235,205,-1,0.8,-1);
  directionalLight(235,235,225,1.5,-0.6,1);
}

class World
{
  ArrayList<Particle> ps = new ArrayList<Particle>();
  ArrayList<Player> players = new ArrayList<Player>();
  ArrayList<Object> objects = new ArrayList<Object>();
  HashMap<String, ArrayList<Particle>> map = new HashMap<String, ArrayList<Particle>>();
  HashSet<String> smap = new HashSet<String>();
  HashSet<String> imap = new HashSet<String>();
  int last = millis();
  int leftOvers = 0;
  int dt = 16;
  int maxits = 4;
  float ax = 0f;
  float ay = 0f;
  float az = 0f;
  float dx, dy, dz;
  float da = 0.01f;
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
    for(int i=objects.size()-1;i>=0;i--){
      Object o = objects.get(i);
      o.update();
    }
    Interactions();
  }
  void Interactions(){
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
  void solve(){
    for(String i : smap){
      ArrayList<Particle> al = map.get(i);
      al.clear();
    }
    smap.clear();
    for(Particle p : ps){
      int x = floor(p.p.x/Particle.R/2f);
      int y = floor(p.p.y/Particle.R/2f);
      int z = floor(p.p.z/Particle.R/2f);
      String i = x+"|"+y+"|"+z;
      if(!imap.contains(i)){
        map.put(i, new ArrayList<Particle>());
        imap.add(i);
      }
      ArrayList<Particle> al = map.get(i);
      al.add(p);
      smap.add(i);
    }
  }
  void display(){
    lighting();
    pushMatrix();
    translate(width/2f, height/2f);
    for(Player p : players){
      if(p == you) continue;
      p.display();
    }
    for(Object o : objects){
      o.display();
    }
    noLights();
    for(Particle o : ps){
      o.display();
    }
    popMatrix();
  }
};
