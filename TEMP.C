
const int motorPin1 = 5;  
const int motorPin2 = 6;  


int motorSpeed = 0;       
bool isClockwise = true;  
const int speedStep = 25; 

void setup() {
  
  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  
  
  Serial.begin(9600);
  
  
  printInstructions();
}

void loop() {
  if (Serial.available() > 0) {
    
    int inByte = Serial.read();
    
    

switch (inByte) {
  case 'W': 
  case 'w': 
    increaseSpeed();
    break;

  case 'S': 
  case 's': 
    decreaseSpeed();
    break;

  case 'D': 
  case 'd': 
    setDirection(true); 
    break;

  case 'A': 
  case 'a': 
    setDirection(false); 
    break;

  default:
    
    break;
}

    
    
    updateMotor();
    
    
    printStatus();
  }
}

void increaseSpeed() {
  if (motorSpeed < 255) {
    motorSpeed = min(255, motorSpeed + speedStep);
  }
}

void decreaseSpeed() {
  if (motorSpeed > 0) {
    motorSpeed = max(0, motorSpeed - speedStep);
  }
}

void setDirection(bool clockwise) {
  isClockwise = clockwise;
}

void updateMotor() {
  if (isClockwise) {
    analogWrite(motorPin1, motorSpeed);
    analogWrite(motorPin2, 0);
  } else {
    analogWrite(motorPin1, 0);
    analogWrite(motorPin2, motorSpeed);
  }
}

void printInstructions() {
  Serial.println("DC Motor Control System");
  Serial.println("----------------------");
  Serial.println("Controls:");
  Serial.println("↑ - Increase speed");
  Serial.println("↓ - Decrease speed");
  Serial.println("→ - Clockwise direction");
  Serial.println("← - Counter-clockwise direction");
  Serial.println("----------------------");
}

void printStatus() {
  Serial.print("Speed: ");
  Serial.print(map(motorSpeed, 0, 255, 0, 100));
  Serial.print("% | Direction: ");
  Serial.println(isClockwise ? "Clockwise" : "Counter-clockwise");
}