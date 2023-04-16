// Binary Tree Maze in P3 by vvixi
// needs work

byte blk = 20;
byte w = 20;
byte h = 20;
void setup() {

  size(400, 400);
  fill(100);
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      rect(i*blk, j*blk, blk, blk);
    }
  }
  make_binaryTree();
}
// for each cell in maze, if N and W exists
// pick either to connect to

void make_binaryTree() {
  
  fill(40);
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      if (i < w) {
        rect(i*blk, 0*blk, blk, blk);
      }
      if (j < h) {
        rect(0*blk, j*blk, blk, blk);
      }
      // make sure north and west cells are within array boundaries
      if (i - 1 > 0 && j - 1 > 0) {
        if (random(2) > 0.5) {
          rect((i-1)*blk, j*blk, blk, blk);
        } else {
          rect(i*blk, (j-1)*blk, blk, blk);
        }
      }
    }
  }
}
