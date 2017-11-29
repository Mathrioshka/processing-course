void setup() {
  size(640, 480);
  background(0);
}

void draw() {
  background(0);
  
  float distance = dist(mouseX, mouseY, pmouseX, pmouseY);
  
  ellipse(mouseX, mouseY, distance, distance);
}