class Drop {
  float x, y;
  int coursenum = 4;
  float speed;
  color c;
  float r;
  Drop() {
    r = 8;
    y = (int)random(coursenum)*height/4+height/8;
    x = r*4+width;
    speed = random(1, 5);
  }
  void move() {
    x -= speed;
  }
  void display() {
    for(int i=2; i<8; i++){
      // 葉
      strokeWeight(7);
      stroke(66,165,0);
      line(x,y,x+25-i*2,y-15-i);
      // 根
      noStroke();
      fill(255,107,66);
      ellipse(x+i*2-20,y-i*5+45, i*3, i*3);
    }
    strokeWeight(1);
    stroke(255,185,0);
    line(x-12,y+5,x,y+10);
    line(x-10,y+13,x-1,y+18);
    line(x-18,y+21,x-12,y+24);
  }
  void caught() {
    speed = 0;
    y = -1000;
  }
  boolean reachedBottom() {
    if (x < -r*4) {
      x = width+1000;
      speed = 0;
      return true;
    } else {
      return false;
    }
  }
}
