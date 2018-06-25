import ddf.minim.*;

Minim minim;
AudioPlayer groove;

void setup()
{
  size(640, 480);

  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 1024);
  groove.loop();
}

float angle;

void draw()
{
  //background(0);
  
  ellipseMode(CENTER);
  
  translate(mouseX, mouseY);
  
  rotate(radians(angle += 1));
  
  ellipse(-50, -50, groove.left.get(0) * 100, groove.left.get(0) * 100);
  ellipse(50, -50, groove.left.get(1) * 100, groove.left.get(1) * 100);
  ellipse(-50, 50, groove.left.get(2) * 100, groove.left.get(2) * 100);
  ellipse(50, 50, groove.left.get(3) * 100, groove.left.get(3) * 100);
}