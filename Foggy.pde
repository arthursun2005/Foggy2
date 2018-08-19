/**
 * Copyright © Arthur Sun
**/

import java.util.*;
PFont font; // mono
World world = new World();
Player you;
PGraphics textGraphics;
float textResolution = 16f;

void setup(){
  fullScreen(P3D);
  frameRate(60);
  background(0);
  smooth();
  perspective(PI/3f, float(width)/float(height), 1f, 65536f);
  font = createFont("monospace", 80);
  you = new Player();
  world.players.add(you);
  world.you = you;
  textureMode(NORMAL);
  textureWrap(REPEAT);
  Cuboid o1 = new Cuboid();
  world.objects.add(o1);
  o1.cuboid.p.set(0,0,-200);
  o1.cuboid.r.set(80,50,80);
  o1.setText("HELLO!!!", "YOU", "180", "Great!", "Arthur", "END" ,color(255),color(25));
}

void setTextGraphicsSize(int a, int b){
  textGraphics = createGraphics(a,b,P2D);
  textGraphics.smooth();
}

void writeText(String text, color back, color t, float x, float y){
  textGraphics.beginDraw();
  textGraphics.background(back);
  textGraphics.textAlign(CENTER, CENTER);
  textGraphics.fill(t);
  textGraphics.textSize(textGraphics.width/text.length()*1.6f);
  textGraphics.text(text, float(textGraphics.width)*x, float(textGraphics.height)*y);
  textGraphics.endDraw();
}

void draw(){
  background(0);
  world.update();
  world.display();
}
