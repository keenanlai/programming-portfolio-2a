class powerup {
  // member variables
  int x, y, diam, speed;
  // PImage rock;

  // constructor
  powerup() {
    x = int(random(width));
    y = -200;
    diam = int(random(20, 75));
    ;
    speed = int(random(1, 5));
    //rock = loadImage("powerup1.png");
  }

  void display() {
    fill(127);
    ellipse(x, y, diam, diam);
    // image(rock, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(spaceship bruhs) {
    float d = dist(this.x, this.y, bruhs.x, bruhs.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
