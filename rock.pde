class rock {
  // member variables
  int x, y, diam, speed;
  PImage rock;

  // constructor
  rock() {
    x = int(random(width));
    y = -200;
    diam = int(random(20, 75));;
    speed = int(random(1, 5));
    rock = loadImage("rock1.png");
  }

  void display() {
    image(rock, x, y);
    rock.resize(diam,diam);
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
}
