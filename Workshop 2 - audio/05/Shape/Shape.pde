import ddf.minim.*;

Minim minim;
AudioPlayer groove;

float radius[] = new float[360];
float audioAmp = 1000;

int angle;

void setup()
{
  size(640, 480);
  
  frameRate(60);
  
  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 512);
  groove.loop();
}

void draw ()
{
  //background(100);
  
  translate(mouseX, mouseY);
  rotate(radians(angle));
  
  
  
  beginShape();
  
  for (int i = 0; i < 360; i++)
  {
    radius[i] += 2 + (groove.left.get(i) * audioAmp - radius[i]) * 0.1;
   
    float x = radius[i] * cos(radians(i));
    float y = radius[i] * sin(radians(i));

    noStroke();
    vertex(x, y);
    
    stroke(0, 0, 0, 200);
    strokeWeight(0.5);
    fill(255, 200);
    ellipse(x, y, radius[i] / 5, radius[i] / 5);
  }
  
  endShape();
  
  angle++;
}