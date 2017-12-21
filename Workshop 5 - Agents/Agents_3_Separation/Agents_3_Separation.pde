import controlP5.*;

ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();

ControlP5 cp5;

float maxSpeed = 4;
float maxForce = 0.1;

int vehiclesCount = 1;

void setup() {
  size(640, 360);

  cp5 = new ControlP5(this);

  cp5.addSlider("maxSpeed", 0, 10).linebreak();
  cp5.addSlider("maxForce", 0, 1);

  for (int i = 0; i < vehiclesCount; i++) {
    vehicles.add(new Vehicle(random(0, width), random(0, height)));
  }
}

void draw() {
  background(200);

  for (Vehicle v : vehicles) {
    v.applyBehaviours(vehicles);

    v.update();
    v.display();
  }
}

