void RotateX(PVector p, float a){
  // x value doesn't change
  float m = mag(p.z, p.y);
  a += atan2(p.y, p.z);
  p.z = m*cos(a);
  p.y = m*sin(a);
}

void RotateY(PVector p, float a){
  // y value doesn't change
  float m = mag(p.z, p.x);
  a += atan2(p.x, p.z);
  p.z = m*cos(a);
  p.x = m*sin(a);
}

void RotateZ(PVector p, float a){
  // z value doesn't change
  float m = mag(p.x, p.y);
  a += atan2(p.y, p.x);
  p.x = m*cos(a);
  p.y = m*sin(a);
}

void Rotate(PVector p, float ax, float ay, float az){
  RotateX(p, ax);
  RotateY(p, ay);
  RotateZ(p, az);
}

class AABB
{
  // p is the center,  r is the radius
  PVector p = new PVector();
  PVector r = new PVector();
  AABB(){}
  AABB(PVector a, PVector b){
    p.set(a);
    r.set(b);
  }
  boolean vsPoint(PVector i){
    return i.x>p.x-r.x && i.x<p.x+r.x && i.y>p.y-r.y && i.y<p.y+r.y && i.z>p.z-r.z && i.z<p.z+r.z;
  }
  boolean vsAABB(AABB i){
    return i.p.x+i.r.x>p.x-r.x && i.p.x-i.r.x<p.x+r.x && i.p.y+i.r.y>p.y-r.y && i.p.y-i.r.y<p.y+r.y && i.p.z+i.r.z>p.z-r.z && i.p.z-i.r.z<p.z+r.z;
  }
};

class RotatedAABB extends AABB
{
  PVector p = new PVector();
  PVector r = new PVector();
  PVector a = new PVector();
  AABB getAABB(){
    // ??
    return new AABB();
  }
  boolean vsPoint(PVector _i){
    PVector _p = p.copy();
    PVector i = _i.copy();
    Rotate(_p, a.x, a.y, a.z);
    Rotate(i, a.x, a.y, a.z);
    return i.x>_p.x-r.x && i.x<_p.x+r.x && i.y>_p.y-r.y && i.y<_p.y+r.y && i.z>_p.z-r.z && i.z<_p.z+r.z;
  }
  boolean vsAABB(RotatedAABB i){
    // ??
    return false;
  }
};
