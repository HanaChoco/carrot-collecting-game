class Catcher {
  float r;       //半径
  float x, y;     //位置

  Catcher(float tempR) {
    r = tempR;    //半径は引数で指定
    x = 0;
    y = 0;
  }
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  void display() {
  size(500,500);
  strokeWeight(7);
  stroke(0);
  line(x+43,y,x+45,y-10);
  // フロント
  stroke(255,0,0);
  line(x+60,y,x+40,y-20);
  // 椅子
  stroke(116,80,48);
  line(x+17,y,x+14,y-15);
  stroke(0);
  line(x-20,y-6,x+50,y-2);
  // 車体
  strokeWeight(0);
  fill(255,0,0);
  rect(x-40,y-2,10,24);
  rect(x+90,y-2,10,24);
  rect(x-35,y-5,130,30);
  // ライト
  strokeWeight(1);
  stroke(150);
  fill(240);
  rect(x+85,y-2,15,3);
  fill(180);
  rect(x-40,y-2,10,5);
  fill(255,255,0);
  rect(x+85,y+1,15,3);
  // 光沢
  stroke(255);
  strokeWeight(2);
  line(x-5,y, x+40, y);
  // マフラー
  stroke(100);
  strokeWeight(5);
  line(x-41, y+22, x-35, y+22);
  // タイヤ
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(x, y+20, r-10,r-10);
  ellipse(x+60,y+20, r-10,r-10);
  fill(155);
  ellipse(x, y+20, r-16,r-16);
  ellipse(x+60,y+20, r-16,r-16);
  fill(240);
  ellipse(x, y+20, r-22,r-22);
  ellipse(x+60,y+20, r-22,r-22);
  }
  boolean intersect(Drop d) {
    // float distance = dist(x, y, d.x, d.y);
    float distance = dist(x+50, y, d.x, d.y);
    if (distance < r + 2*d.r) {
      return true;
    } else {
      return false;
    }
  }
}
