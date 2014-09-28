/**
 * Explode 
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls breaking apart of image and 
 * Maps pixels from a 2D image into 3D space. Pixel brightness controls 
 * translation along z axis. 
 */

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="eames.jpg"; */ 

PImage img, gem;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system

void setup() {
  size(1203, 805, P3D); 
  //img = loadImage("gem_glitch_purple.png");  // Load the image
  img = loadImage("Screenshot 2014-08-22 00.19.59.png");  // Load the image

  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
}

void draw() {
  background(255);
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      //float z = (mouseX / float(height)) * brightness(img.pixels[loc]) +0.0;
        float z = cos(second()) * brightness(img.pixels[loc]) +0.0;

      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate( x, y+0, z +100);
      fill(c, 254);
      noStroke();
      rectMode(LEFT);
      rect(0, 0, 15, 1);
      popMatrix();
    }
  }
}
