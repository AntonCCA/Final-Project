import processing.serial.*;

Serial myPort;

void setup() {
  size(500, 500);

  printArray(Serial.list());
  myPort = new Serial(this, "/dev/cu.usbmodem143101", 9600);
}

void draw() {
  background(255);
}

//void mousePressed() {
//  myPort.write("f");


void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP)
      myPort.write("f");
  }

  if (key == CODED) {
    if (keyCode == DOWN)
      myPort.write("b");
  }

  if (key == CODED) {
    if (keyCode == LEFT)
      myPort.write("l");
  }
  if (key == CODED) {
    if (keyCode == RIGHT)
      myPort.write("r");
  }
}
