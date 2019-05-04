class Point {
  PVector pos;
  PVector vel;

  float max_vel = 2;

  float offset = 100;

  Point() {
    pos = new PVector(random(width), random(height));
    //pos = PVector.random2D();
    //pos.add(new PVector(width / 2, height / 2));
    //vel = new PVector(random(-max_vel, max_vel), random(-max_vel, max_vel));
    vel = PVector.random2D();
  }

  Point(PVector p) {
    pos = p.copy();
    //pos = PVector.random2D();
    //pos.add(new PVector(width / 2, height / 2));
    //vel = new PVector(random(-max_vel, max_vel), random(-max_vel, max_vel));
    vel = PVector.random2D();
  }

  Point(PVector p, PVector v) {
    pos = p.copy();
    vel = v.copy();
  }

  void update() {
    pos.add(vel);
    //pos.x = pos.x <= 0 ? width : pos.x >= width ? 0 : pos.x;
    //pos.y = pos.y <= 0 ? height : pos.y >= height ? 0 : pos.y;
    vel.x = pos.x <= -offset || pos.x >= width + offset ? -vel.x : vel.x;
    vel.y = pos.y <= -offset || pos.y >= height + offset ? -vel.y : vel.y;
  }
}
