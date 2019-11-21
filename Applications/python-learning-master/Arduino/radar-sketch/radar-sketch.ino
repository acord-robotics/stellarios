int pin = 4;

void setup() {
  // put your setup code here, to run once:
  pinMode(pin,INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int value = digitalRead(pin);
  Serial.println(value);
  delay(1000); // miliseconds
}
