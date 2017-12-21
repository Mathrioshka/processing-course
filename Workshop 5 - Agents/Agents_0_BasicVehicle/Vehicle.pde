class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Vehicle(float x, float y) {
    location = new PVector(x, y);
  }

  void seek(PVector target) {
    location = target;
  }

  void display() {
    fill(127);
    ellipse(location.x, location.y, 10, 10);
  }
}

