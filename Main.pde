/*----------------------------------------------------*\
|code to create animations for the LOL-shield.        |
|code an object moving in the void draw. choose count |
| of frames at "frame_max"                            |
\*----------------------------------------------------*/

int frame_max = 102; // calculate +2

//------------------------------------
PrintWriter output; // Splitting a String based on a multiple delimiters

int cols = 15;
int rows = 10;
int[][] graphic = new int[cols][rows];

float e = 0; //dotn change
int frames = 0;

void setup() {
  output = createWriter("animation.txt"); // create the txt
  size(14, 9, P3D);
  background(255);
}
void draw() {
  if (frames == frame_max) {  // save the txt and kill the window
    savetxt();
  }
  // draw here
  background(255);
  translate(7, 4.5, 0); 
  rotate(e,0,0,1);
  stroke(0);
  noFill();
  smooth(8);
  rectMode(CENTER);
  rect(2,2,1,1);
  e = e + 0.1;
  //-------
  frames++;
  
    if (frames >= 2) {  // first 2 frames are crap
    calc(); // makes a frame
  }
}

void calc() {

  for (int i = 0; i < width; i++) {      //save screen as array
    for (int j = 0; j < height; j++) {
      color c = get(i, j);
      if (c == #000000) {              //black = 1, white = 0
        graphic[i][j] = 1;
      } else if (c == #ffffff) {
        graphic[i][j] = 0;
      }
    }
  }
  output.print("{");          //calculate and print syntax
  for (int x = 0; x < height; x++) {
    output.print(((((((((((((((graphic[0][x]*1)+(graphic[1][x]*2))+(graphic[2][x]*4))+(graphic[3][x]*8))+(graphic[4][x]*16))+(graphic[5][x]*32))+(graphic[6][x]*64))+(graphic[7][x]*128))+(graphic[8][x]*256))+(graphic[9][x]*512))+(graphic[10][x]*1024))+(graphic[11][x]*2048))+(graphic[12][x]*4096))+(graphic[13][x]*8192)));
    output.print(",");
  }
  output.println("},");
  println("Done");   // done =^-^=
}

void savetxt() {
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  exit();
}

void keyPressed() {  // manual controls, s = save frame, p = save and quit
  if (key=='s') {
    calc();
  } else if (key == 'p') {
    savetxt();
  }
}

// cat says Thank you! =^-^=
