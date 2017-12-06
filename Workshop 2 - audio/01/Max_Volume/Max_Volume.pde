import ddf.minim.*;

Minim minim;
AudioPlayer groove;

void setup()
{
  size(640, 480);

  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 512);
  groove.loop();
}

float scale;
float x;
float y;

void draw()
{
  background(0);
  
  float volume = groove.left.get(0) * 1000;
  scale += (volume - scale) * 0.1;
  
  x += (mouseX - x) * 0.1;
  y += (mouseY - y) * 0.1;
  
  fill(100);
  
  ellipse(x, y, scale, scale);
}