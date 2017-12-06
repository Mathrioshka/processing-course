import ddf.minim.*;

Minim minim;
AudioInput in;
AudioPlayer groove;


void setup()
{
  size(640, 480);
  frameRate(60);

  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 1024);
  //groove.loop();
  
  in = minim.getLineIn(Minim.STEREO, 1024);
}

void draw()
{
 
  background(0);
  
  stroke(255);
  int i = 0;
  
  for (i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }
  
}