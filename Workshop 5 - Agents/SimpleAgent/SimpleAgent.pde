Vehicle vehicle;

void setup() {
  size(640, 360);
  vehicle = new Vehicle(width/2, height/2);
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);

  // Draw an ellipse at the mouse location
  fill(200);
  stroke(0);
  strokeWeight(2);
  ellipse(mouse.x, mouse.y, 48, 48);

  // Call the appropriate steering behaviors for our agents
  vehicle.seek(mouse);
  vehicle.update();
  vehicle.display();
}

