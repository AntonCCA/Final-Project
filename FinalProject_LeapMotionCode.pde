import processing.serial.*;
import de.voidplus.leapmotion.*;
LeapMotion leap;
Serial myPort;

void setup() {
  size(800, 500);
  background(255);
  leap = new LeapMotion(this);
  println(Serial.list()[0]);
  myPort = new Serial(this, "/dev/cu.usbmodem143101", 9600); //put your arduino port here
}

void leapOnConnect() {
  println("I connected!");
}

void draw() {
  background(255);
  for (Hand hand : leap.getHands()) {      
    pushMatrix();
    float handSize = hand.getSphereRadius();
    float yaw = hand.getYaw();
    float pitch = hand.getPitch();
    if(handSize>125 && yaw > 30 ){
      myPort.write("r"); // motor is on and hand directs right
      println("r");
    }
    else 
      if(handSize>125 && yaw < -30 ){
      myPort.write("l"); // motor is on and hand directs left
      println("l");
      } 
    else 
      if(pitch < -30){
      myPort.write("f"); // motor is on and hand directs front
      println("f");
      }
    else 
      if(pitch > 30){
      myPort.write("b"); // motor is on and hand directs back
      println("b");
      } 
    else 
      if(handSize < 125 ){
      myPort.write(5); // motor is off
      println("5");
      } 
    println(handSize, yaw);
    popMatrix();
  }
}
