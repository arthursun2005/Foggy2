/**
 * Created by Arthur Sun
 * Copyright © Arthur Sun
**/

PFont font; // mono
World world = new World();
Player you;
Player p2;
Particle pt;
PImage face;

void setup(){
  fullScreen(P3D);
  smooth();
  perspective(PI/3f, float(width)/float(height), 16f, 65536f);
  font = createFont("monospace", 80);
  textFont(font);
  face = loadImage("face.png");
  you = new Player();
  world.players.add(you);
  world.you = you;
  p2 = new Player();
  p2.pos.set(1,-2,-20);
  world.players.add(p2);
  p2.texture = face;
  textMode(MODEL);
  textureMode(NORMAL);
  textureWrap(REPEAT);
}

void stats(){
  noLights();
  textAlign(CENTER);
  textSize(2);
  stroke(255);
  pushMatrix();
  translate(you.pos.x, you.pos.y, you.pos.z);
  translate(width/2f, height/2f);
  translate(-5,-5,-30);
  text((int)frameRate+" FPS", 0, 0);
  popMatrix();
}

void lighting(){
  directionalLight(235,255,205,-1,1,-0.5);
  directionalLight(255,235,205,-1,0.8,-1);
  directionalLight(235,235,225,1.5,-0.6,1);
}

void draw(){
  background(0);
  lighting();
  if(keyPressed && key == ' '){
    for(int n=0;n<60;n++){
      pt = new Particle(FIRE);
      pt.god = world;
      pt.p.set(0,0,-300);
      pt.v.set(PVector.random3D());
      pt.v.mult(random(2.5f));
      world.ps.add(pt);
    }
  }
  if(keyPressed && key == 'p'){
    println(world.ps.size());
  }
  world.update();
  world.display();
}
