 //Breakout Game
//Amy Huang
//10-27-20
//1-2B

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//gif variables
PImage[] peppa;
int frame;


//brick variables
int [] x;  
int [] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;

//mode framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int WINNER   = 4;
final int LOSER    = 5;

//entity variables
float paddlex, paddley, paddled;
float ballx, bally, balld;
float vx, vy;
int score, lives, timer;

//keyboard variables
boolean rightkey, leftkey, enter;

//colors
color lime = #ccff7f;
color green =#B2DBA6;
color otherred = #F585B6;
color blue = #9fcaff;
color red = #D19CAF;
color darkblue = #5A79D3;
color peach = #FACBAC;
color yellow = #FAE4AC;

//sound variables
Minim minim;
AudioPlayer intro, breaking, boop, beep, win, failure;

void setup() {
  //load animated gif
  peppa = new PImage[15];
  int j = 0;
  while(j < 15){
  peppa[j] = loadImage ("frame_"+j+"_delay-1s.gif");
  j = j + 1;
}
   brickd = 50;
  n = 35;
  x = new int[n];
  y = new int[n];
  alive = new boolean [n];
  tempx = 100;
  tempy = 100;
  
  //initialize score 
  score = 0;
  lives = 3;
  timer = 100;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    i++;
    if (tempx == 800) {
      tempx = 100;
      tempy = tempy + 100;
    }
  }
  strokeWeight(3);
  size (800, 800);
  mode = INTRO;

  //initialize paddle
  paddlex = width/2;
  paddley = 800;
  paddled = 200;

  //initialize ball
  ballx = width/2;
  bally = 600;
  balld = 10;
  vx = random(-5, 5);
  vy = random(-5, 5);
  //initialize keyboard variables
  rightkey = leftkey = false;
   
    //minim
  minim = new Minim ( this );
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  breaking = minim.loadFile("break.wav");
  boop = minim.loadFile("boop.wav");
  beep = minim.loadFile("beep.wav");
  win = minim.loadFile("win.wav");
  failure = minim.loadFile("failure.wav");
}



void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WINNER) {
    winner();
  } else if (mode == LOSER) {
    loser();
  } else {
  }
}
