import controlP5.*;

Vehicle vehicle;

ControlP5 cp5;

float maxSpeed = 4;
float maxForce = 0.1;

void setup() {
  size(640, 360);
  vehicle = new Vehicle(width / 2, height / 2);

  cp5 = new ControlP5(this);

  cp5.addSlider("maxSpeed", 0, 10).linebreak();
  cp5.addSlider("maxForce", 0, 1);
}

void draw() {
  background(200);

  PVector target = new PVector(mouseX, mouseY);
  vehicle.seek(target);
  vehicle.update();
  vehicle.display();
}

