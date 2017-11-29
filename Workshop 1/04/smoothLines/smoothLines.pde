
float x;
float y;
float r;

void setup() {
  size(640, 480);
  smooth();
}

void draw() {
  background(255);
  
  x += (mouseX - x) * 0.1;
  
  y += (mouseY - y) * 0.1;
  
  r += (dist(mouseX, mouseY, pmouseX, pmouseY) * 5 - r) * 0.1;
  
  stroke(0);
  strokeWeight(1);
  ellipse(x, y, r, r);
}