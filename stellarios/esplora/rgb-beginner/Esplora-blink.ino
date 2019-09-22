/*
  Esplora Blink

 This  sketch blinks the Esplora's RGB LED. It goes through
 all three primary colors (red, green, blue), then it
 combines them for secondary colors(yellow, cyan, magenta), then
 it turns on all the colors for white.
 For best results cover the LED with a piece of white paper to see the colors.

 Created on 22 Dec 2012
 by Tom Igoe

 This example is in the public domain.
 */

#include <Esplora.h>

// This is the original code

void setup() {
  // There's nothing to set up for this sketch
}

void loop() {
  Esplora.writeRGB(255, 0, 0);  // make the LED red
  delay(1000);                  // wait 1 second
  Esplora.writeRGB(0, 255, 0);  // make the LED green
  delay(1000);                  // wait 1 second
  Esplora.writeRGB(0, 0, 255);  // make the LED blue
  delay(1000);                  // wait 1 second
  Esplora.writeRGB(255, 255, 0); // make the LED yellow
  delay(1000);                  // wait 1 second
  Esplora.writeRGB(0, 255, 255); // make the LED cyan
  delay(1000);                  // wait 1 second
  Esplora.writeRGB(255, 0, 255); // make the LED magenta
  delay(1000);                  // wait 1 second
  Esplora.writeRGB(255, 255, 255); // make the LED white
  delay(1000);                  // wait 1 second


// Edited Code (with black LED)
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

0,0 ,0 black

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
  Esplora.writeRGB(0,0 ,0 ); //make the RGB turn black
  delay(350); //delay 350 milliseconds
  
  //repeat code
}