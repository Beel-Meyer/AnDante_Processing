
int led1 = 2;         // the number of the input pin
int led2 = 3;         // the number of the input pin
int led3 = 4;         // the number of the input pin
int led4 = 5;         // the number of the input pin

int outPin1 = 8;       // the number of the output pin
int outPin2 = 9;       // the number of the output pin
int outPin3 = 10;       // the number of the output pin
int outPin4 = 11;       // the number of the output pin
int outPinGlobal = 13;       // the number of the output pin
int outPinAgua = 12;

int state1 = HIGH;      // the current state of the output pin
int reading1;           // the current reading from the input pin
int previous1 = LOW;    // the previous reading from the input pin

int state2 = HIGH;      // the current state of the output pin
int reading2;           // the current reading from the input pin
int previous2 = LOW;    // the previous reading from the input pin

int state3 = HIGH;      // the current state of the output pin
int reading3;           // the current reading from the input pin
int previous3 = LOW;    // the previous reading from the input pin

int state4 = HIGH;      // the current state of the output pin
int reading4;           // the current reading from the input pin
int previous4 = LOW;    // the previous reading from the input pin

int pasoPor1;
int pasoPor2;
int pasoPor3;
int pasoPor4;


boolean tomar = true;
int contadorAgua;

// the follow variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long time = 0;         // the last time the output pin was toggled
long debounce = 200;   // the debounce time, increase if the output flickers

void setup()
{
  Serial.begin(9600);
  pinMode(led1, INPUT);
  pinMode(led2, INPUT);
  pinMode(led3, INPUT);
  pinMode(led4, INPUT);
  pinMode(outPin1, OUTPUT);
  pinMode(outPin2, OUTPUT);
  pinMode(outPin3, OUTPUT);
  pinMode(outPin4, OUTPUT);
  pinMode(outPinGlobal, OUTPUT);
  pinMode(outPinAgua, OUTPUT);

  contadorAgua = 0;

    int pasoPor1 = 0;
    int pasoPor2 = 0;
    int pasoPor3 = 0;
    int pasoPor4 = 0;
}

void loop()
{

    unsigned long currentMillis = millis();

    if (tomar == true){
        digitalWrite(outPinAgua, HIGH);
    }

    if (tomar == false){
        digitalWrite(outPinAgua, LOW);
    }



    /* LED 1 -------------------------------------- */
  reading1 = digitalRead(led1);

  // if the input just went from LOW and HIGH and we've waited long enough
  // to ignore any noise on the circuit, toggle the output pin and remember
  // the time
  if (reading1 == HIGH && previous1 == LOW && millis() - time > debounce) {
    if (state1 == HIGH)
      state1 = LOW;
    else
      state1 = HIGH;

    time = millis();    
  }

  previous1 = reading1;

  if (state1 == LOW){
  	digitalWrite(outPin1, LOW);
        if ((tomar == true) && (pasoPor1 == 0)) {
            pasoPor1 = 1;
            tomar = false;
            contadorAgua = 0;
        }
  }
  else{
  	digitalWrite(outPin1, HIGH);
    pasoPor1 = 0;
  }

    /* LED 2 -------------------------------------- */
  reading2 = digitalRead(led2);

  // if the input just went from LOW and HIGH and we've waited long enough
  // to ignore any noise on the circuit, toggle the output pin and remember
  // the time
  if (reading2 == HIGH && previous2 == LOW && millis() - time > debounce) {
    if (state2 == HIGH)
      state2 = LOW;
    else
      state2 = HIGH;

    time = millis();    
  }

  previous2 = reading2;

  if (state2 == LOW){
  	digitalWrite(outPin2, LOW);
      if ((tomar == true) && (pasoPor2 == 0)) {
            pasoPor2 = 1;
            tomar = false;
            contadorAgua = 0;
        }
      
  }
  else{
  	digitalWrite(outPin2, HIGH);
      pasoPor2 = 0;
  }

    /* LED 3 -------------------------------------- */
  reading3 = digitalRead(led3);

  // if the input just went from LOW and HIGH and we've waited long enough
  // to ignore any noise on the circuit, toggle the output pin and remember
  // the time
  if (reading3 == HIGH && previous3 == LOW && millis() - time > debounce) {
    if (state3 == HIGH)
      state3 = LOW;
    else
      state3 = HIGH;

    time = millis();    
  }

  previous3 = reading3;

  if (state3 == LOW){
  	digitalWrite(outPin3, LOW);
      if ((tomar == true) && (pasoPor3 == 0)) {
            pasoPor3 = 1;
            tomar = false;
            contadorAgua = 0;
        }
  }
  else{
  	digitalWrite(outPin3, HIGH);
      pasoPor3 = 0;
  }

    /* LED 4 -------------------------------------- */
  reading4 = digitalRead(led4);

  // if the input just went from LOW and HIGH and we've waited long enough
  // to ignore any noise on the circuit, toggle the output pin and remember
  // the time
  if (reading4 == HIGH && previous4 == LOW && millis() - time > debounce) {
    if (state4 == HIGH)
      state4 = LOW;
    else
      state4 = HIGH;

    time = millis();    
  }

  previous4 = reading4;

  if (state4 == LOW){
  	digitalWrite(outPin4, LOW);
    if ((tomar == true) && (pasoPor4 == 0)) {
        pasoPor4 = 1;
        tomar = false;
        contadorAgua = 0;
    }
  }
  else{
  	digitalWrite(outPin4, HIGH);
      pasoPor4 = 0;
  }


  
  /* Si todos LOW, enciende el global */
  if ((state1 == LOW) && (state2 == LOW) && (state3 == LOW) && (state4 == LOW)){
  	digitalWrite(outPinGlobal, HIGH);
  }
  else{
  	digitalWrite(outPinGlobal, LOW);
  }

  contadorAgua++;
  Serial.println(contadorAgua);

  if(contadorAgua > 150) {
        tomar = true;
    }
}