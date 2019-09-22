/*
this code is free to everyone!! feel free to use it change it and have fun!!
RGB codes
255,0 ,0 red

255, 128,0 orange

255,255 ,0 yellow

0,255 ,0 green

255,255 ,0 cyan

0,0 ,255 blue

255,0 ,255 magenta

*/
#include <Esplora.h> //include the esplora in the code
void setup() {
    //put all your setup code in here
}

void loop() {
  //put all you code that you want to run forever in here
  Esplora.writeRGB(255,0 ,0 ); //make the RGB turn red 
  delay(350); //delay 350 milliseconds
  Esplora.writeRGB(255, 128,0 ); //make the RGB turn orange
  delay(350); //delay 350 milliseconds
  Esplora.writeRGB(255,255 ,0 ); //make the RGB turn yellow
  delay(350); //delay 350 milliseconds
  Esplora.writeRGB(0,255 ,0 ); //make the RGB turn green
  delay(350); //delay 350 milliseconds
  Esplora.writeRGB(255,255 ,0 ); //make the RGB turn cyan
  delay(350); //delay 350 milliseconds
  Esplora.writeRGB(0,0 ,255 ); //make the RGB turn blue
  delay(350); //delay 350 milliseconds
  Esplora.writeRGB(255,0 ,255 ); //make the RGB turn magenta
  delay(350); //delay 350 milliseconds
  
  //repeat code
}