class Gauge {
  int hp;
  int maxHp;
  int minHp;
  int midHp;
  
  float x, y;
  float gaugeWidth;
  float gaugeHeight;
  Gauge(int tempMaxHp) {
    maxHp = tempMaxHp;
    midHp = (int)maxHp*3/4;
    minHp = (int)maxHp/3;
    hp = maxHp;
    x = 0;
    y = 0;
    gaugeWidth = width;
    gaugeHeight = 20;
  }
  void display() {
    float bWidth = gaugeWidth/maxHp;
    rectMode(CORNER);
    noStroke();
    // ケージの色
    // hpがmaxHpの5分の1以下であれば赤色に
    if(hp < minHp){
      fill(255,0,0);
    }else if(hp < midHp){
      fill(255,255,0);
    }else fill(0, 255, 0);
    
    for (int i=0; i<hp; i++) {
      rect(x+i*bWidth, y, bWidth, gaugeHeight);
    }
    noFill();
    stroke(100, 0, 0);
    rect(x, y, gaugeWidth, gaugeHeight);
  }
  void damage() {
    hp--;
  }
  // 体力の回復
  void heal(){
    hp++;
  }
  boolean isEmpty() {
    if (hp<=0) {
      return true;
    } else {
      return false;
    }
  }
  void reset(int tempMaxHp) {
    maxHp= tempMaxHp;
    hp = maxHp;
  }
}
