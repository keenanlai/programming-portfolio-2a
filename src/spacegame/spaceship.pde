class spaceship {
  // member variables
  int x, y, w, health, laserCount, turretCount;

  // constructor
  spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 10;
    turretCount = 1;
  }

  void display() {
    fill(50);
    rect(x+30, y+40, 15, 15);
    rect(x-30, y+40, 15, 15);
    triangle(x, y-35, x+45, y+35, x-45, y+35);
    fill(100);
    triangle(x, y-25, x+8, y-10, x-8, y-10);
    ellipse(x, y+20, 20, 0);
    stroke(220);
    strokeWeight(2);
    line(x+20, y-20, x+20, y-20);
    line(x-20, y-20, x-20, y-20);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
