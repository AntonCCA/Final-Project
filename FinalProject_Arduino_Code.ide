``` javascript

`#` Arduino code

#include <Wire.h>
#include <Adafruit_MotorShield.h>

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield();
// Or, create it with a different I2C address (say for stacking)
// Adafruit_MotorShield AFMS = Adafruit_MotorShield(0x61);

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *MotorLeft = AFMS.getMotor(1);
// You can also make another motor on port M2
Adafruit_DCMotor *MotorRight = AFMS.getMotor(2);

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("startup");

  AFMS.begin();  // create with the default frequency 1.6KHz
  //AFMS.begin(1000);  // OR with a different frequency, say 1KHz

  // Set the speed to start, from 0 (off) to 255 (max speed)
  MotorLeft->setSpeed(200);
  MotorRight->setSpeed(200);

}

void loop() {
  char c ;
  c = Serial.read();

  if (c == 'f') {
    Serial.println("moving forward");
    MotorLeft->run(FORWARD);
    MotorRight->run(FORWARD);
    delay(300);
    MotorLeft->run(RELEASE);
    MotorRight->run(RELEASE);
  }

  if (c == 'b') {
    Serial.println("moving backward");
    MotorLeft->run(BACKWARD);
    MotorRight->run(BACKWARD);
    delay(300);
    MotorLeft->run(RELEASE);
    MotorRight->run(RELEASE);
  }

  if (c == 'l') {
    Serial.println("moving left");
    MotorLeft->run(BACKWARD);
    MotorRight->run(FORWARD);
    delay(150);
    MotorLeft->run(RELEASE);
    MotorRight->run(RELEASE);
  }

  if (c == 'r') {
    Serial.println("moving right");
    MotorLeft->run(FORWARD);
    MotorRight->run(BACKWARD);
    delay(150);
    MotorLeft->run(RELEASE);
    MotorRight->run(RELEASE);
  }

  // flush anything in the input buffer that may have arrived while we were sleeping (to avoid multiple commands from bunching up)
  while (Serial.available()) {
    Serial.read();
  }
}

```


