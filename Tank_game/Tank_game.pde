Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

PImage background;
int score;
Timer objTimer;

void setup() {
  size(500, 500);
  score = 0;
  t1 = new Tank();

  background = loadImage("background1.png");
  background.resize(width, height);

  objTimer = new Timer(1000);
  objTimer.start();
}

void draw() {
  background(background);
  imageMode(CORNER);
  image(background, 0, 0);

  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(0, random(height), 100,100,random(2,5),10));
    objTimer.start();
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

  for (int i = projectiles.size()-1; i >= 0; i--) {
    Projectile p = projectiles.get(i);

    for (int j = obstacles.size()-1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);

      if (p.intersect(o)) {
        projectiles.remove(i);
        obstacles.remove(j);
        score += 100;
        break;
      }
    }

    p.display();
    p.move();
  }

  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;

  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /=mag;
    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
}
