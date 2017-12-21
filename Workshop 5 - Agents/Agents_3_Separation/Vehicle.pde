class Vehicle {
  PVector location;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  float radius = 10;

  Vehicle(float x, float y) {
    location = new PVector(x, y);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);

    location.add(velocity);

    acceleration.mult(0);
  }

  void applyForce(PVector force)
  {
    acceleration.add(force);
  }

  void applyBehaviours(ArrayList<Vehicle> vehicles)
  {
    PVector separateForce = separate(vehicles);
    PVector seekForce = seek(new PVector(mouseX, mouseY));

    separateForce.mult(2);
    seekForce.mult(1);

    applyForce(separateForce);
    applyForce(seekForce);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.setMag(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    return steer;
  }

  PVector separate (ArrayList<Vehicle> vehicles)
  {
    float desiredSeparation = radius * 2;
    PVector sum = new PVector();
    int count = 0;

    for (Vehicle otherVehicle : vehicles){
      float distance = PVector.dist(location, otherVehicle.location);

      if(distance > 0 && distance < desiredSeparation) {
        PVector vectorDiff = PVector.sub(location, otherVehicle.location);
        vectorDiff.normalize();

        //Не понимаю
        vectorDiff.div(distance);

        sum.add(vectorDiff);
        count++;
      }
    }

    if(count > 0) {
      sum.div(count);

      sum.normalize();
      sum.mult(maxSpeed);

      sum.sub(velocity);
      sum.limit(maxForce);
    }

    return sum;
  }

  void display() {
    fill(127);
    ellipse(location.x, location.y, radius, radius);
  }
}