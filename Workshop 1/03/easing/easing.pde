float r = 0.0;

void setup() {
  size(640, 480);
  smooth();
}

void draw() {
  background(0);
  
  float targetR = dist(mouseX, mouseY, pmouseX, pmouseY) * 3;
  
  r += (targetR - r) * 0.1;
  
  stroke(100);
  strokeWeight(2);
  ellipse(mouseX, mouseY, r, r);
}