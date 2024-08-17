class CarrotCounter {
  // 獲得した人参の個数
  int count;
  CarrotCounter() {
    count = 0;
  }
  // カウント
  void add() {
    count++;
  }
  // ゲーム中における獲得数の表示 
  void display() {
    fill(255,180,50);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("CARROT : " + count,width-80, 35);
  }
  // 獲得数を返す
  int getCount(){
    return count;
  }
  // 獲得数のリセット
  void reset(){
    count = 0;
  }
}
