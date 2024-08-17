class Timer {
  int savedTime;      //タイマースタート時刻
  int totalTime;     //タイマー設定時間
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  void start() {      //タイマーをリセットして始めるメソッド
    savedTime = millis(); 
  }
  boolean isFinished() {   //設定時間になったか調べるメソッド
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;    //設定時間になったらtrueを返す
    } else {
      return false;
    }
  }
}
