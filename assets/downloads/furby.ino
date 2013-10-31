// Furby's pins are done at compiler time, so lets use a IO performance library
#define DIGITALIO_NO_INTERRUPT_SAFETY
#define DIGITALIO_NO_MIX_ANALOGWRITE
#include "digitalIOPerformance.h"

// Pins the h bridge (sn754410) is attached to.
const unsigned int motorEnable = 8;
const unsigned int motorForwardPin = 9;
const unsigned int motorReversePin = 10;
// How fast we want the motor to turn
const unsigned int motorSpeed = 189;

// Direction motor is going in. 2 = clockwise, 0 = anticlockwise, 1 = halted 
byte motorDirection = 1;

// A command sent to furby
byte furbyCommand = 0;

// Furby's cam drive position (the thing the motor turns)
byte camPosition = 0;

// These are volatile because ISRs effect them
volatile boolean camFlag = 0;
volatile boolean homeFlag = 0;

void setup() {
  // This is just for the IR LED (I didn't have a spare resistor)
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH); 
  // Set up the motor h-Bridge pins 
  pinMode(motorEnable, OUTPUT);
  pinMode(motorForwardPin, OUTPUT);
  pinMode(motorReversePin, OUTPUT);
  // Start serial comms
  Serial.begin(57600);
  // Home the furby
  homeFurby();
}

void loop() {
    // Check to see if we have new data in the serial buffer. If we do update with the new position.
    if (Serial.available() > 0) {
      furbyCommand = Serial.read() - '0' ;
      if((furbyCommand >= 0) && (furbyCommand<=9)){
        switch(furbyCommand) {
          case 0:
            if(camPosition != furbyCommand){
              homeFurby();
              break;
            }
          case 1:
            openMouth();
            break;
          case 2:
            closeMouth();
            break;
          default:  
            break;
        }
    } 
    }
}

void homeSwitchISR() {
  // If the home button is pressed just update the home variable.
  // Worth putting on a cap to debounce the switch.
  homeFlag = 1;  
}

void wheelEncoderISR() {
  // If the home button is pressed just update the home variable.
  // Worth putting on a cap to debounce the switch.
  camFlag = 1;  
}

void homeFurby() {
  // If furby is currently moving then lets stop that.
  resetMotor();
  // If opto interrupt is attached, disable it during this process. Also disable, if set, the normal homeSwitchISR, this way we can home furby at anytime.
  detachInterrupt(0); 
  detachInterrupt(1); 
  // Assume the furby is wrong. Just move the motor foward until the home switch is pressed.
  motorDirection = 2;
  analogWrite(motorReversePin, 0);
  analogWrite(motorForwardPin, motorSpeed); 
  attachInterrupt(0, homeSwitchISR, RISING);
  digitalWrite(motorEnable, HIGH); 
  while(homeFlag!=1){
  }
  // If we got here the Home switch has been pressed, so: switch off motor, clear the home switch flag, set camPosition to 0, and then finally attach the interupt for the optoencoder. 
  resetMotor();
  homeFlag = 0;
  camPosition = 0;
  // This interupt services home button presses (normal version). It is on 0 (pin 2) so it has a higher priority than the opto encoder. 
  attachInterrupt(1, wheelEncoderISR, FALLING);
  // Furby is ready for duty
}

void openMouth(){
  furbyDoSomething(15);
}  

void closeMouth(){
  furbyDoSomething(4);
}  


void resetMotor(){
    // Fire the brake, then turn off the signals to the motors. Update direction flag.
   digitalWrite(motorEnable, LOW);  
   motorDirection = 1;
}

void furbyDoSomething(byte furbyMovetoByte){
        if(motorDirection == 1){
          if((((camPosition - furbyMovetoByte) + 200) % 200) > 100){
             motorDirection = 2;
             analogWrite(motorReversePin, 0);
             analogWrite(motorForwardPin, motorSpeed);            
          } else {
            motorDirection = 0;
            analogWrite(motorForwardPin, 0);
            analogWrite(motorReversePin, motorSpeed);
          }
        digitalWrite(motorEnable, HIGH); 
      }
      while(camPosition != furbyMovetoByte){
        if(homeFlag == 1){
          camPosition = 0;
          homeFlag = 0;
        } else{
          if(camFlag == 1){    
            if(motorDirection==2){
              camPosition = camPosition + 1;
            } else {
              camPosition = camPosition - 1;
              if(camPosition == 255){
                camPosition = 200;
              }  
            }
          camFlag=0;  
          }       
       }           
    }
    resetMotor();
}
