// Binary Tree Maze in P3 by vvixi
float blk, w, h;

void setup() {

  size(600, 600);
  w = width/10;
  h = height/10;
  blk = width/50;
  
  fill(100);
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      rect(i * blk, j * blk, blk, blk);
    }
  }
  make_binaryTree();
}

void make_binaryTree() {
  
  fill(40);
  for (int i = 0; i < w; i+=2) {
    for (int j = 0; j < h; j+=2) {
      
      // top and left are always set to path
      if (i < w) {
        rect(i * blk, 0 * blk, blk, blk);
      }
      if (j < h) {
        rect(0 * blk, j * blk, blk, blk);
      }
     
      // make sure north and west cells are within array boundaries
      // if both exist then choose either randomly
      if (i - 1 > 0 && j - 1 > 0) {
        if (random(2) > 0.5) {
          rect(i * blk, j*blk, blk, blk);
          rect((i - 1) * blk, j * blk, blk, blk);
        } else {
          rect(i * blk, j * blk, blk, blk);
          rect(i * blk, (j - 1) * blk, blk, blk);
        }

      // if cell is available west, but not north
      } else if (i - 1 < 0 && j - 1 > 0) {
      rect(i * blk, (j - 1) * blk, blk, blk);
      // if cell is available north, but  not west
      } else if (i - 1 > 0 && j - 1 < 0) {
      rect((i - 1) * blk, j * blk, blk, blk);
      }
    }
  }
}
