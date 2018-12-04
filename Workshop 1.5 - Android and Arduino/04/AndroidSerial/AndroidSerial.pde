import io.inventit.processing.android.serial.*;

Serial myPort;

void setup() {
  myPort = new Serial(this, Serial.list(this)[0], 9600);
}

void draw() {
  if (myPort.available() > 0) {
    String data = myPort.readStringUntil('\n');

    background(0);
    text(data, width/2, height/2);
  }
}
