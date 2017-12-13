import ddf.minim.*;

Minim minim;
AudioInput in;
AudioPlayer groove;
float amplitude = 500;

void setup() {
  size(640, 480);
  frameRate(60);

  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 1024);
  groove.loop();
  
  //in = minim.getLineIn(Minim.STEREO, 1024);
}

void draw() {
  background(0);
  stroke(255);
  
  for (int i = 0; i < groove.bufferSize() - 1; i++)
  {
    line(i, 50 + groove.left.get(i)*amplitude, i+1, 50 + groove.left.get(i+1)*amplitude);
    line(i, 150 + groove.right.get(i)*amplitude, i+1, 150 + groove.right.get(i+1)*amplitude);
  }
  
}