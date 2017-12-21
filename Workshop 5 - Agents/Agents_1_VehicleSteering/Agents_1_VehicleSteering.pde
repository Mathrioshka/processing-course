Vehicle vehicle;

void setup() {
  size(640, 360);
  vehicle = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(255);

  PVector target = new PVector(mouseX, mouseY);
  vehicle.seek(target);
  vehicle.update();
  vehicle.display();
}

