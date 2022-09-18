// Drunken Walk by vvixi
// This is a useful algorithm for procedural level design in games.
float blk;
float c;
//PVector zero = new PVector(0,0);
PVector up = new PVector(0,-1);
PVector down = new PVector(0,1);
PVector left = new PVector(-1,0);
PVector right = new PVector(1,0);
PVector[] dirs = {up, right, down, left}; // N, E, S, W
int index = 0;
int gridSz = 100;
int[][] grid = new int[gridSz][gridSz];
PVector current;
int forward;

void setup() {
  // We could constrain the walk to the map boundaries,
  // but I have opted to allow it to wrap around the screen.
  // Setting a noise seed would allow us to consistently draw
  // an area for a game.
  // Could also change dir when the walk runs into a previously
  // visited space.
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
      grid[i][j] = 255;
    }
  }
  // starting block
  current = new PVector(gridSz/2, gridSz/2);
  grid[int(current.x)][int(current.y)] = 0;
  fill(0);
  rect(current.x*blk, current.y*blk, blk, blk);
  forward = choose();
  PVector step = dirs[forward];
  current.add(step);
}

int choose() {
  forward = 0;
  c++;
  if (c > 200) {
    c = 0;
  }
  forward = int(random(dirs.length));
  return forward;
}
void draw() {
  // Wrap the drunken walk around the screen.
  if (current.x < 0 ) {
    current.x = gridSz-1;
  } else if (current.y < 0) {
    current.y = gridSz-1;
  } else if (current.x > gridSz-1) {
    current.x = 0;
  } else if (current.y > gridSz-1) {
    current.y = 0;
  } 
  if (grid[int(current.x)][int(current.y)] != 1){
    // choose dir and pick a tile that is not set to -1
    c++;
    fill(c, c, 300);
    rect(current.x*blk, current.y*blk, blk, blk);
    grid[int(current.x)][int(current.y)] = 0;
    forward = choose();
    PVector step = dirs[forward];
    current.add(step);
  }
}
