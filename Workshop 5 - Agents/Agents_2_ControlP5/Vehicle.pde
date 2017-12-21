class Vehicle {
  PVector location;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  Vehicle(float x, float y) {
    location = new PVector(x, y);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);

    location.add(velocity);

    acceleration.mult(0);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.setMag(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    acceleration.add(steer);
  }

  void display() {
    fill(127);
    ellipse(location.x, location.y, 10, 10);
  }
}