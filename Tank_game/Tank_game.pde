// 1 April 2026 | TankGame by Peter Shumway
Tank t1;
PImage background;

void setup () {
  size(500, 500);
  t1 = new Tank();
  background = loadImage("background.png");
  background.resize(width, height);
}

void draw () {
  background(background);
  t1.display();
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
