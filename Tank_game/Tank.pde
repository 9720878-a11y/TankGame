class Tank {
  float x, y, w, h, speed, health;
  PImage tankA, tankW, tankS, tankD;
  char idir;

  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 30;
    health = 75;

    tankS = loadImage("tankS.png");
    tankD = loadImage("tankD.png");
    tankA = loadImage("tankA.png");
    tankW = loadImage("tankW.png");

    idir = 'w';
  }

  void display() {
    imageMode(CENTER);
    if (idir=='s') image(tankS, x, y);
    if (idir=='w') image(tankW, x, y);
    if (idir=='d') image(tankD, x, y);
    if (idir=='a') image(tankA, x, y);
  }

  void move(char dir) {
    if (dir == 's') { idir='s'; y += speed; }
    if (dir == 'w') { idir='w'; y -= speed; }
    if (dir == 'a') { idir='a'; x -= speed; }
    if (dir == 'd') { idir='d'; x += speed; }
  }

  boolean intersect(Obstacle o) {
    return dist(x, y, o.x, o.y) < 100;
  }
}
