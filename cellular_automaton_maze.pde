// Mazectric Cellular Automaton algorithm in P3 by vvixi
/*
    This produces results similar to Mazectric and Mazectric
    with mice. It is similar to Conway's Game of Life, but
    harder for cells to die off.
*/
float blk;
float col;
int index = 0;
int gridSz = 100;
int[][] gridprev = new int[gridSz][gridSz];
int[][] gridnew = new int[gridSz][gridSz];

void setup() {
  
  // create initial empty grid
  colorMode(HSB, 360);
  frameRate(8);
  size(800, 800);
  background(40);
  stroke(200, 100, 0);
  blk = width/100;
  for (int i = 1; i < gridprev.length-1; i++) {
    for (int j = 1; j < gridprev[0].length-1; j++) {

      if (int(random(16)) == 1) {
        gridprev[i][j] = 1;
      }

    }
  }
}

void draw() {
  col++;
  if (col > 360) {
    col = 0;
  }
  // show board state
  for (int i = 0; i < gridprev.length; i++) {
    for (int j = 0; j < gridprev[0].length; j++) {
      if (gridprev[i][j] == 1) {
        fill(col, 360, 360);
      } else {
        fill(40);
      }
      stroke(100, 200, 200, 50);
      rect(i*blk, j*blk, blk, blk);
    }
  }
  startLife();
}

public void startLife() {
  
  // define the cell's neighbors
  PVector N = new PVector(0, -1);
  PVector E = new PVector(1, 0);
  PVector S = new PVector(0, 1);
  PVector W = new PVector(-1, 0);
  PVector NE = new PVector(1, -1);
  PVector SE = new PVector(1, 1);
  PVector SW = new PVector(-1, 1);
  PVector NW = new PVector(-1, -1);
  
  PVector[] neighbors = {N, E, S, W, NE, SE, SW, NW};
  
  // we need to check neighbors for each space in the grid and store the results
  // of every check into the gridnew buffer, we then set gridprev to gridnew
  // to visualize the new board state

  for (int i = 1; i < gridprev.length-1; i++) {
    for (int j = 1; j < gridprev[0].length-1; j++) {
      int liveCounter = 0;
      int deadCounter = 0;
      for (int k = 0; k < neighbors.length; k++) {
        if (gridprev[i][j] == 1) {

          // check neighbors, increment counter for each alive neighbor
          if (gridprev[i+int(neighbors[k].x)][j+int(neighbors[k].y)] == 1) {
            liveCounter++;
          }
      
        } else if (gridprev[i][j] == 0) {

          // tally live neighbors of a dead cell
          if (gridprev[i+int(neighbors[k].x)][j+int(neighbors[k].y)] == 1) {
            deadCounter++;
          }
        }
      } 
      // growing maze with mice
      //if (liveCounter > 1 && liveCounter <5 || deadCounter == 3) {
      // clouds
      //if (liveCounter < 2 && liveCounter > 3 || deadCounter == 2) {
      // growing / changing maze
      if (liveCounter == 2 || liveCounter == 3 || deadCounter == 3) {
      // checkers
      //if (liveCounter < 2 && liveCounter > 3 || deadCounter == 1) {
      // brain matter
      //if (liveCounter < 2 || liveCounter == 3 || deadCounter == 4) {
        gridnew[i][j] = 1;
      } else {
        gridnew[i][j] = 0;
      }
    }
  }
  gridprev = gridnew;
}
