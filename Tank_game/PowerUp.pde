class PowerUp {
  float x, y, w, h, speed;
  PImage powerup;

  PowerUp(float x, float y) {
    this.x = x;
    this.y = y;
    w = 40;
    h = 40;
    speed = 1;

    powerup = loadImage("powerup.png");
  }

  void display() {
    imageMode(CENTER);
    image(powerup, x, y, w, h);
  }

  void move() {
    x += speed;
  }

  boolean offScreen() {
    return x > width + w;
  }
}
