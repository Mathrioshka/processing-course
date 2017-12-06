import ddf.minim.*;

Minim minim;
AudioPlayer groove;

float radius = 50;
float audioAmp = 100;

void setup()
{
  size(640, 480);
  smooth();
  
  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 512);
  groove.loop();
}

void draw ()
{
  background(100);

  translate(mouseX, mouseY);

  for (int i = 0; i < 360; i++)
  {
    float x = radius * cos(radians(i));
    float y = radius * sin(radians(i));

    ellipse(x, y, groove.left.get(i) * audioAmp, groove.left.get(i) * audioAmp);
  }
}