// Keenan Lai | 6 Nov 2024 | SpaceGame | Ω≈√ç∫µåß¬˚∆∂˙©ƒ†∑¥π®¥ø¨ˆœ´£¢™¢∞¶ª¡
import processing.sound.*;
SoundFile laser1;
int score, level;
boolean play;
spaceship bruh;
ArrayList<rock> rocks = new ArrayList<rock>();
ArrayList<laser> lasers = new ArrayList<laser>();
ArrayList<powerup> pup = new ArrayList<powerup>();
ArrayList<star> stars = new ArrayList<star>();
timer rtime, putime;


void setup() {
  size(800, 800);
  laser1 = new SoundFile(this, "lasaer.wav");
  bruh = new spaceship();
  rtime = new timer(0);
  rtime.start();
  putime = new timer(999999999);
  putime.start();
  noCursor();
}

void draw() {
  if (!play) {
    startScreen();
  } else {

    background(0);
    stars.add(new star());
    for (int i = 0; i < stars.size(); i++) {
      star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    noCursor();
    for (int i = 0; i < rocks.size(); i++) {
      rock rok = rocks.get(i);
      rok.display();
      rok.move();
      if (bruh.intersect(rok)) {
        bruh.health -= rok.diam;
        rocks.remove(rok);
        score += rok.diam;
      }
    }
    for (int i = 0; i < lasers.size(); i++) {
      laser lasr = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        rock r = rocks.get(j);
        if (lasr.intersect(r)) {
          //if a laser intersect a rock what do we want to happen to the rock and to the laser
          // type your answer here in plain english : remove rock and laservery good
          score+=r.diam;
          lasers.remove(lasr);
          r.diam-=10;
          if (r.diam<5) {
            rocks.remove(r);
            //now do the same for rock ok
            // two mistakes are present one by me one by you nu uh
            lasr.display();
            lasr.move();
            if (lasr.reachedTop()) {
              rocks.remove(r);
            }
          }
        }
      }
      bruh.display();
      bruh.move(mouseX, mouseY);
      infoPanel();
      if (bruh.health < 0) {
        gameOver();
        noLoop();
      }
      if (rtime.isFinished()) {
        rocks.add(new rock());
        rtime.start();
      }
    }
  }
}
void keyPressed() {
  if (key == ' ' && bruh.fire()) {
    lasers.add(new laser(bruh.x, bruh.y));
    bruh.laserCount--;
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(35);
  text("Score:" + score, 20, 35);
  text("Health:" + bruh.health, 180, 35);
  text("Ammo:" + bruh.laserCount, 370, 35);
  text("Level:" + level, 525, 35);
}

void startScreen() {
  background(0);
  fill(255);
  text("Wlelceome sspace to gaem", width/2, 300);
  text("click tosrtart", width/2, 400);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("u smeely bro", width/2, 300);// yicheng put that in it was not supposed to be smeelly
  text("scor:" + score, width/2, 400);
  if (mousePressed) {
    play = false;
  }
}

void ticker() {
}

void mousePressed() {
  if (bruh.fire()) {
    laser1.play();
    lasers.add(new laser(bruh.x, bruh.y));
    bruh.laserCount--;
  }
}
