int gseq;
int px = 200;
int py = 420;
int pw = 40;
int ph = 20;
float bx;
float by;
float spdx;
float spdy;
int bw = 7;
int bh = 7;
int phit = 0;
int blw = 78;
int blh = 30;
int[] blf = new int[25];

void setup() {
  size(400, 500);
  noStroke();
  colorMode(HSB, 100, 100, 100);
  gameInit();
}

void draw() {
  background(0);
  if( gseq == 0){
    gameTitle();
  } else if( gseq == 1){
    gamePlay();
  } else {
    gameOver();
  }
}

void gameInit(){
  gseq = 0;
  bx = 100;
  by = 250;
  spdx = 2;
  spdy = 2;
  phit = 0;
  for(int i = 0; i < 25; i++){
    blf[i] = 1;
  }
}

void gameTitle(){
  gseq =1;
}

void gamePlay(){
  playerMove();
  playerDisp();
  blockDisp();
  ballMove();
  ballDisp();
}

void gameOver(){
}

void playerDisp(){
  fill(0, 0, 100);
  rect(px, py, pw, ph, 5);
}

void playerMove(){
  px = mouseX;
  if( (px + pw) > width ){
    px = width - pw;
  }
}

void ballDisp(){
  imageMode(CENTER);
  fill(0, 0, 100);
  rect(bx, by, bw, bh);
  imageMode(CORNER);
}

void ballMove(){
  bx += spdx;
  by += spdy;
  if( by > height ){
    spdy = -spdy;
  }
  if( by < 0 ){
    spdy = -spdy;
  }
  if( ( bx < 0) || (bx > width) ){
    spdx = -spdx;
  }
  if( (phit == 0) && (px < bx) && (px + pw > bx)
  && (py < by) && (py + ph > by) ){
    spdy = -spdy;
    phit = 1;
  }
  if( by < py - 30 ){
    phit = 0;
  }
}

void blockDisp(){
  int xx, yy;
  for(int i = 0; i < 25; i++){
    if( blf[i] == 1 ){
      fill((i / 5) * 15, 100, 100);
      xx = (i % 5) * (blw + 2);
      yy = 50 + (i / 5) * (blh + 2);
      blockHitCheck(i, xx, yy);
      if( blf[i] == 1 ){
        rect(xx, yy, blw, blh, 2);
      }
    }
  }
}

void blockHitCheck(int ii, int xx, int yy){
  if( !((xx < bx) && (xx + blw > bx)
    && (yy < by) && (yy + blh > by)) ){
      return;
    }
    blf[ii] = 0;
}
