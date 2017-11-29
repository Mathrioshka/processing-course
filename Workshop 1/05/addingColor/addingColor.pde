import processing.pdf.*;

float x;
float y;
float r;
int h;

void setup() {
  size(640, 480);
  smooth();
  
  beginRecord(PDF, "export.pdf");
  background(0);
}

void draw() {
  //background(255);
  
  x += (mouseX - x) * 0.1;
  y += (mouseY - y) * 0.1;
  
  float targetR = dist(mouseX, mouseY, pmouseX, pmouseY) * 5;
  
  r += (targetR - r) * 0.1;
  
  stroke(0);
  strokeWeight(2);
  
  colorMode(HSB);
  color c = color(h, 255, 255);
  fill(c);
  
  ellipse(x, y, r, r);
  
  h++;
  if(h > 255) {
    h = 0;
  };
}

void exit() {
  endRecord();
  
  super.exit();
}