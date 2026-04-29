class Projectile {
  float x, y, w, h,speed;
  float vx, vy;

  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
   
    w = 10;
    h = 10;
  }

  void display() {
    fill(127, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean intersect(Obstacle o) {
    return dist(x, y, o.x, o.y) < 50;
  }
}
