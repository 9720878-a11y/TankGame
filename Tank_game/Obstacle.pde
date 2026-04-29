class Obstacle {
  float x, y, w, h, speed, health;
  PImage img;

  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;

    img = loadImage("Obstacle.png");
  }

  void display() {
    imageMode(CENTER);
    image(img, x, y, w, h);
  }

  void move() {
    x += speed;
  }

  boolean offScreen() {
    return x > width + w;
  }
}
