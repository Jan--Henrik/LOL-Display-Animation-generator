PrintWriter output;
// Splitting a String based on a multiple delimiters
String stuff[] = loadStrings("/home/JanHenrik/sketchbook/sign_remover/input.txt");
String pass_string = "},";              //set sytax of the end of every line

int frame_max = 30; // calculate +2

int cols = 15;
int rows = 10;
int[][] graphic = new int[cols][rows];

float e = 0;
int frames = 0;



void setup() {
  output = createWriter("animation.txt");
  size(14, 9, P3D);
  background(255);
}
void draw() {
  if (frames == frame_max) {
    savetxt();
  }
  // draw here
  background(255);
  translate(7, 4.5, 0); 
  rotateY(e);
  stroke(0);
  noFill();
  box(4.5);

  delay(10);

  e = e + 0.1;
  frames++;
    if (frames >= 2) {
    calc(); // makes a frame
  }
}

void calc() {

  for (int i = 0; i < width; i++) {      //speichere bildschirm in Array
    for (int j = 0; j < height; j++) {
      color c = get(i, j);
      if (c == #000000) {              //Schwarz = 1, Weiß = 0
        graphic[i][j] = 1;
      } else if (c == #ffffff) {
        graphic[i][j] = 0;
      }
    }
  }
  output.print("{");
  for (int x = 0; x < height; x++) {
    output.print(((((((((((((((graphic[0][x]*1)+(graphic[1][x]*2))+(graphic[2][x]*4))+(graphic[3][x]*8))+(graphic[4][x]*16))+(graphic[5][x]*32))+(graphic[6][x]*64))+(graphic[7][x]*128))+(graphic[8][x]*256))+(graphic[9][x]*512))+(graphic[10][x]*1024))+(graphic[11][x]*2048))+(graphic[12][x]*4096))+(graphic[13][x]*8192)));
    output.print(",");
  }
  output.println("},");
  println("Done");
}

/* void convert() {
 
 
 for (int j = 0; j < stuff.length; j++) {            //trennt die zeilen von einander
 String[] list = splitTokens(stuff[j], " \t");     //entefernt Tab und leezeichen
 for (int i = 0; i < list.length; i++) {           //Schreibt alles hintereinander
 print(list[i]);
 output.print(list[i]);
 if (list[i].equals(pass_string)) {
 output.println("");                  //setzt "Enter" wenn eine Zeile voll ist
 }
 }
 }
 output.flush();  // Writes the remaining data to the file
 output.close();  // Finishes the file
 exit();
 }
 */
void savetxt() {
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  exit();
}

void keyPressed() {
  if (key=='s') {
    calc();
  } else if (key == 'p') {
    savetxt();
  }
}
