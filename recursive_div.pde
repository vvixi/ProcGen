// Recursive division algorithm in P3 by vvixi
float blk;
float c;
int index = 0, mid, path;
int gridSz = 100;
int[][] grid = new int[gridSz][gridSz];

void setup() {
  surface.setTitle("Recursive Division");
  // create initial empty grid to recursively divide on
  colorMode(HSB, 300);
  frameRate(120);
  size(800, 800);
  background(0);
  stroke(200, 100, 0);
  blk = width/100;
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      fill(40);
      stroke(100, 200, 200, 50);
      rect(i*blk, j*blk, blk, blk);
    }
  }
  
  div_map(0, gridSz, gridSz, 6);
}

void draw() {
  // pass
}

public void div_map(int start, int _mapW, int _mapH, int _iter) {
  int mapW = _mapW;
  int mapH = _mapH;
  int iter = _iter;
  int cullA, cullB;
  boolean hori;
  //if (mapW > mapH) { hori = true; 
  
  //} else if (mapH > mapW) { hori = false;
  
  //} else {
  if (random(0, mapW+mapH) < mapW) { hori = false;} else { hori = true;} 
  

  if (!hori) {
    // make vert div

    if (mapH/2 > 3) { mid = mapW/2; } else { return; }

    cullA = int(random(mapH));
    cullB = cullA - 1;
    for (int i = start; i < mapH; i++) {
      if (i != cullA && i != cullB) {
        fill(c, c, 300);
        rect(mid * blk, i * blk, blk, blk);
      }
    }
    mapW /= 2;
    iter--;
  }
  
  
  else if (hori) {
    // make hor div
    if (mapW/2 > 3) { mid = mapH/2; } else {return; }

    cullA = int(random(mapW));
    cullB = cullA - 1;
    
    for (int i = start; i < mapW; i++) {
      if (i != cullA && i != cullB) {
        fill(c, c, 300);
        rect(i * blk, mid * blk, blk, blk);
      }
    }
    mapH /= 2;
    iter--;
  }
  
  // mid to mapW, 0 to mid, call recursively on each new div
  if (iter>0) {div_map(0, mapW, mapH, iter);}
  
}
