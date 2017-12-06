void setup()
{
  size(640, 480);
}

float angle;

void draw()
{
  background(0);
  
  ellipseMode(CENTER);
  
  translate(mouseX, mouseY);
  
  rotate(radians(angle++));
  
  ellipse(-50, -50, 25, 25);
  ellipse(50, -50, 25, 25);
  ellipse(-50, 50, 25, 25);
  ellipse(50, 50, 25, 25);
}