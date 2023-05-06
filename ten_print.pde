// ten print algorithm by vvixi
float blk, x, y;
int gridSz = 20;

void setup() {
  surface.setTitle("Ten Print");
  background(40);
  stroke(255);
  size(600, 600);
  blk = width/gridSz;
}

void draw() {
  if (random(1) > 0.5) {
    line(x, y, x+blk, y+blk);
  } else {
    line(x, y+blk, x+blk, y);
  }
  x += blk;
  if (x > gridSz * blk && y != gridSz*blk) {
    x = 0;
    y += blk;
  }
}
