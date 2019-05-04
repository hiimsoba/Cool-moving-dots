final int NUM_PTS = 250;
ArrayList<Point> points;

float min_distance = 125;

void setup() {
  fullScreen();

  noSmooth();

  points = new ArrayList<Point> ();

  for (int i = 0; i < NUM_PTS; i++) {
    points.add(new Point());
  }

  frameRate(60);

  colorMode(HSB);
}

void draw() {
  background(0);
  for (Point p : points) {
    p.update();
  }

  strokeWeight(0.5);
  stroke(255);
  for (Point p1 : points) {
    for (Point p2 : points) {
      if (p1 == p2) {
        continue;
      }
      float d = dist(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
      if (d <= min_distance) {
        stroke(map(d, 0, min_distance, 0, 255), 255, 255);
        line(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
      }
    }
  }

  //text(frameRate, 100, 100);
}
