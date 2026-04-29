// 1 april 2026 | TankGame | Ben Stalsberg
//Tank game
Tank t1;

ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();

PImage bg;
int score,speed;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  score = 0;
  t1 = new Tank();

  bg = loadImage("background1.png");
  bg.resize(width, height);

  objTimer = new Timer(1000);
  objTimer.start();

  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(0);
  imageMode(CORNER);
  image(bg, 0, 0);


  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(0, random(height), 100, 100, random(2, 5), 10));
    objTimer.start();
  }

 
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp(0, random(height)));
    puTimer.start();
  }

 
  for (int i = obstacles.size()-1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();

    if (t1.intersect(o)) {
      t1.health -= 10;
      obstacles.remove(i);
      continue;
    }

    if (o.offScreen()) {
      obstacles.remove(i);
    }
  }

  // 
  for (int i = projectiles.size()-1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    boolean removed = false;

    for (int j = obstacles.size()-1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);

      if (p.intersect(o)) {
        projectiles.remove(i);
        obstacles.remove(j);
        score += 100;
        removed = true;
        break;
      }
    }

    if (removed) continue;

    // remove when off screen
    if (p.x < 0 || p.x > width || p.y < 0 || p.y > height) {
      projectiles.remove(i);
      continue;
    }

    p.display();
    p.move();
  }

 
  for (int i = powerups.size()-1; i >= 0; i--) {
    PowerUp p = powerups.get(i);
    p.display();
    p.move();

    float d = dist(t1.x, t1.y, p.x, p.y);
    if (d < 50) {
      t1.health = min(t1.health + 20, 100);
      powerups.remove(i);
      continue;
    }

    if (p.offScreen()) {
      powerups.remove(i);
    }
  }

  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') t1.move('w');
  if (key == 's') t1.move('s');
  if (key == 'a') t1.move('a');
  if (key == 'd') t1.move('d');
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;


  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 10;
    projectiles.add(new Projectile(t1.x, t1.y, dx * 5, dy * 5));
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);

  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Score: " + score + "  Health: " + int(t1.health), width/2, 22  );
}
