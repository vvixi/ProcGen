// basic 1D Cellular Automata by vvixi
float t;
CA ca;

void setup() {
  surface.setTitle("1D Cellular Automata");
  size(600, 600);
  frameRate(12);
  background(255);
  colorMode(HSB, 130);
  ca = new CA();
}

void draw() {
  ca.display();
  if (ca.generation < height / ca.w || ca.generation > height) {
    ca.generate();
  }
}

class CA {
  int[] cells;
  int[] rules = {0,0,0,0,0,0,0,0};
  int generation;
  //int[] rules = {0,0,1,1,0,1,1,0}; // 54
  //int[] rules = {1,0,1,1,0,1,1,0}; //182
  //int[] rules = {1,1,1,1,1,0,1,0}; // 250
  //int[] rules = {0,1,1,1,1,0,1,1}; // Rulle 222
  //int[] rules = {0,1,1,1,1,1,0,1}; // Rule 190
  //int[] rules = {0,1,1,1,1,0,0,0}; // Rule 30
  //int[] rules = {0,1,1,1,0,1,1,0}; // Rule 110
  //int[] rules = {0,1,0,1,1,0,1,0}; // Rule 9
  int w = 5;
  
  CA() {
    cells = new int[width/w];
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    for(int i = 0; i < 8; i++) {
      rules[i] = int(random(2));
    }
    cells[cells.length / 2] = 1;
    generation = 0;
  }
  
  void generate() {
    
    int[] newgen = new int[cells.length];
    for (int i = 1; i < cells.length - 1; i++) {
      int leftN = cells[i - 1];
      int cur = cells[i];
      int rightN = cells[i + 1];
      if (leftN > 0) {
        leftN = 100;
      
      }else{
        
        leftN = 0;
        
      }
    
      newgen[i] = rules(leftN + cur * 10 + rightN);
    
    }
    cells = newgen;
    generation++;
  }
  
  void display() {
    
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] ==1) fill(t, t, t);
      else fill(0);
      t++;
      noStroke();
      rect(i * w, generation * w, w, height / 2);
      //rect(i * w, generation * w / t, width / 2, height / 2);
      
      if (t > 100) {
        t = 0;
      }
    }
  }
  
  
  int rules(int a) {
    
    switch(a) {
      case 111:
        return rules[0];
      case 110:
        return rules[1];
      case 101:
        return rules[2];
      case 100:
        return rules[3];
      case 011:
        return rules[4];
      case 010:
        return rules[2];
      case 001:
        return rules[3];
      case 000:
        return rules[4];
      
    }
    return 0;
  }
}
