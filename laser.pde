class laser {
  // member variables
  int x, y, w, h, speed;

  // constructor
  laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 3;
  }


  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  boolean intersect(rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedTop() {
    if (y<-50) {
      return true;
    } else {
      return false;
    }
  }
}
