// 2d cellular automata / cave generation by vvixi
float blk;
int gridSz = 100;
int[][] grid = new int[gridSz][gridSz];
int[][] noisegrid = new int[gridSz][gridSz];
PVector current;
int density = 60;
boolean gridcomplete = false;
void setup() {
  frameRate(30);
  size(500, 500);
  blk = width/100;
  grid = make_noisegrid();
  noStroke();
}

int[][] make_noisegrid() {
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (random(100) > density) {
        fill(0);
        rect(i*blk, j*blk, blk, blk);
        noisegrid[i][j] = 0;
      } else {
        fill(255);
        rect(i*blk, j*blk, blk, blk);
        noisegrid[i][j] = 1;
      }
    }
  }
  return noisegrid;
}
void cell_auto(int[][] grid, int count) {
  for (int i = 1; i < count; i++) {
    int[][] temp_grid = grid;
    for (int j = 1; j < count; j++) {
      for (int k = 1; k < gridSz; k++) {
        int neighborWalls = 0;
        for (int y = -1; y < 2; y++) {
          for (int x = -1; x < 2; x++) {
            if (in_map_bounds(x, y)) {
              if (y != j || x != k) {
                if (temp_grid[y][x] == 0) {
                  neighborWalls ++;
            } else {
              neighborWalls++;
        if (neighborWalls > 4) {
          grid[j][k] = 0;
        }else{
          grid[j][k] = 1;
        }
                }
              }
            }
          }
        }
      }
    }
  }
  gridcomplete = true;
}
boolean in_map_bounds(int x, int y) {
   boolean result = false;
    if (x > -1 && x < gridSz) {
      if (y > -1 && y < gridSz) {
        result = true;
      } else {
        result = false;
      }
    }
  return result;
}
  
void draw() {
  cell_auto(grid, 1);
  if (gridcomplete) {
    for (int x = 0; x < gridSz; x++) {
      for (int y = 0; y < gridSz; y++) {
        if (grid[x][y] == 0) {
          fill(0);
          rect(x*blk, y*blk, blk, blk);
        } else if (grid[x][y] == 1) {
          fill(255);
          rect(x*blk, y*blk, blk, blk);
        }
      }
    }
  }
}
