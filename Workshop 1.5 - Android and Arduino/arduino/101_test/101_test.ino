void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  while (!Serial) ;
}

int i = 0;

void loop() {  
  Serial.println(i);

  i++;

  if (i > 100) {
    i = 0;
  }
}
