import processing.sound.*;
int gamestate;

SoundFile files[] = new SoundFile[2];

Drop[] drops = new Drop[500];
int totalDrops = 0;
int healCount = 0;
Catcher catcher;
Timer timer;
Gauge hpGauge;
CarrotCounter carrotCounter;

void setup() {
  gamestate = 0;
  size(500, 500);
  // catcherの大きさ32
  catcher = new Catcher(32);
  timer = new Timer(1000);
  carrotCounter = new CarrotCounter();
  timer.start();
  // 体力の最大値10
  hpGauge = new Gauge(10);
  // サウンドファイル
  for (int i=0; i<2; i++) {
    files[i] = new SoundFile(this, "rec" + (i+1) +".wav");
  }
  smooth();
}

void draw() {
  background(128);
  switch(gamestate) {
  case 0:
    background(100);
    drawTitle();
    break;
  case 1:
    background(128);
    drawGame();
    break;
  case 2:
    background(0);
    drawEnd();
    break;
  case 3:
    background(128,224,234);
    drawClear();
    break;
  }
}

void keyPressed() {
  switch(gamestate) {
  case 0:
    if (key==ENTER || key == RETURN) {
      gamestate = 1;
    }
    break;
  case 2:
    if (key==ENTER || key == RETURN) {
      gamestate = 0;
      hpGauge.reset(10);
      carrotCounter.reset();
    }
    break;
  case 3:
    if (key==ENTER || key == RETURN) {
      gamestate = 0;
      hpGauge.reset(10);
      carrotCounter.reset();
    }
  }
}

void drawGame() {
  strokeWeight(10);
  stroke(220);
  for (int i=1; i<4; i++) {
    line(0, 20+(height/4*i), width, 20+(height/4*i));
  }
  stroke(0);
  strokeWeight(1);
  hpGauge.display();
  carrotCounter.display();
  catcher.setLocation(mouseX, mouseY);
  catcher.display();
  if (timer.isFinished()) {
    drops[totalDrops] = new Drop();
    totalDrops++;
    if (totalDrops >= drops.length) {
      totalDrops = 0;
    }
    timer.start();
  }
  for (int i = 0; i < totalDrops; i++ ) {
    drops[i].move();
    drops[i].display();
    // dropとchatcherの当たり判定
    if (catcher.intersect(drops[i])) {
      files[0].play();
      drops[i].caught();
      carrotCounter.add();
      // にんじん5個獲得で回復
      healCount++;
      if (healCount%5 == 0) {
        hpGauge.heal();
      }
    }
    // i番目のdropが左壁につく⇒trueであれば体力減
    if (drops[i].reachedBottom()) {
      files[1].play();
      hpGauge.damage();
    }
  }
  // 終了判定
  // ゲームオーバー
  if (hpGauge.isEmpty()) {
    gamestate = 2;
  }
  // ゲームクリア
  if (carrotCounter.getCount()==20) {
    gamestate = 3;
  }
}

// タイトル画面
void drawTitle() {
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(255, 160, 0);
  text("Carrot Catch Game", width/2, height/2-80);
  textSize(20);
  fill(125, 255, 50);
  text("▶　Press Enter to Start", width/2, height/2);

  fill(255);
  text("--　How to Play　--", width/2, height/2+60);
  text("Move the Car using your mouse", width/2, height/2+90);
  text("And collect Carrots on the four lanes", width/2, height/2+120);
  fill(255, 180, 180);
  text("Once your HP runs out, Game is Over!!", width/2, height/2+150);
  fill(180, 255, 255);
  text("Collect 5 Carrots, your HP will be restored", width/2, height/2+180);
  fill(80, 255, 255);
  text("--Collect 20 Carrots to CLEAR the GAME--", width/2, height/2+210);
}

// ゲームクリア画面
void drawClear() {
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(255,255,100);
  text("CONGRATULATIONS !!", width/2, height/2-60);
  textSize(30);
  fill(255,255,150);
  text("You have Collected", width/2, height/2+10);
  textSize(40);
  text("20 Carrots", width/2, height/2+40);
  textSize(20);
  fill(203,255,167);
  text("▶　Press Enter to Restart", width/2, height/2 + 100);
}

// ゲームオーバー画面
void drawEnd() {
  textSize(50);
  fill(255,0,0);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2-60);
  textSize(40);
  text("Your Score is " + carrotCounter.getCount(), width/2, height/2);
  textSize(20);
  fill(125, 255, 50);
  text("▶　Press Enter to Restart", width/2, height/2 + 60);
}
