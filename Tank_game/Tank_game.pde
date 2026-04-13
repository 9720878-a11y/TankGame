// 1 April 2026 | TankGame by Ben Stalsberg
Tank t1;
Obstacle o1;
PImage background;


void setup () {
  size(500, 500);
  t1 = new Tank();
  o1 = new Obstacle(400,100,100,50,1,100);
  background = loadImage("background1.png");
  background.resize(width, height);
}

void draw () {
  background(background);
  t1.display();
  o1.display();
  o1.move();
}

void keyPressed() {
  if(key == 'w') {
    t1.move('w');
  } else if(key == 's') {
    t1.move('s');
  } else if(key == 'a') {
    t1.move('a');
  } else if(key == 'd') {
    t1.move('d');
  }
}
