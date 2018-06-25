import ddf.minim.*;

Minim minim;
AudioPlayer groove;

float radius = 50;
float audioAmp = 100;

void setup()
{
  size(640, 480);
  
  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 512);
  groove.loop();
}

float circleRad = 0;
void draw ()
{
  //background(100);

  translate(mouseX, mouseY);
  
  for (int i = 0; i < 360; i++)
  {
    float x = cos(radians(circleRad)) * radius * cos(radians(i));
    float y = cos(radians(circleRad)) * radius * sin(radians(i));

    ellipse(x, y, groove.left.get(i) * audioAmp, groove.left.get(i) * audioAmp);
  }
  
  circleRad+=1;
}