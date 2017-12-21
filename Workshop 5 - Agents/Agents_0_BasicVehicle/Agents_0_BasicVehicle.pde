Vehicle v;

void setup() {
  size(512, 512);
  v = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(255);

  PVector target = new PVector(mouseX, mouseY);
  v.seek(target);
  v.display();
}

