class Timer {
  int savedTime;
  int totalTime;
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  // タイマーをリセットして始める
  void start() {
    savedTime = millis(); 
  }
  // 設定時間になったか調べるメソッド
  boolean isFinished() {
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      // 設定時間になったらtrueを返す
      return true;
    } else {
      return false;
    }
  }
}
