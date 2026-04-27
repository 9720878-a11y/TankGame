class Obstacle {
  float x, y, w, h, speed, health;
  PImage obs1;
  char idir;

  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;

    idir = 'w';
    obs1 = loadImage("Obstacle.png");
  }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1, x, y, w, h);
  }

  boolean offScreen() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    x = x + speed;
    if (x > width+w/2) {
      x = 0;
    }
  }
}
