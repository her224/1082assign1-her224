//soldierSpeed = ?
//laserlength = 40?

PImage sky;
PImage soil;
PImage groundhog;
PImage life;
PImage robot;
PImage soldier;
float blockSize = 80;
float robotX = random(blockSize*2, blockSize * 7);
float robotY = floor(random(2, 5)) * blockSize ;
float soldierX = 0;
float soldierY = floor(random(2, 6)) * blockSize;
float soldierSpeed = 2;
float laserX = robotX + 25;
float laserY = robotY + 37;
float laserSpeed = 5;
float laserlength = 0;
float laserMaxlength = 40;
float laserWidth = 10;
float laserRange = blockSize*2 + 25;

void setup() {
	size(640, 480, P2D);
  //loading image
  sky = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
}

void draw() {
	//setting background
  background(sky);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rectMode(CORNER);
  rect(0, 145, width, 15);
  
  //sun
  noStroke();
  fill(255, 255, 0);
  ellipse(width-50, 50, 130, 130);
  noStroke();
  fill(253, 184, 19);
  ellipse(width-50, 50, 120, 120);
  
  //groundhog
  image(groundhog, 280, 80);
  
  //life
  image(life, 10, 10);
  image(life, life.width + 30, 10);
  image(life, life.width * 2 + 50, 10);
  
  //soil
  image(soil, 0, 160, width, 320);
  
  //soldier
  drawSoldier();
  
  //robot
  image(robot, robotX, robotY);
  
  //laser
  drawLaser();
}

void drawSoldier(){
  image(soldier, soldierX, soldierY);
  soldierX += soldierSpeed;
  
  if(soldierX > width){
    soldierX = -soldier.width;
  }
}

void drawLaser(){
  stroke(255, 0, 0);
  strokeWeight(10);
  strokeCap(ROUND);
  
  //extend laser
  if(laserlength < laserMaxlength){
    laserlength += 3.5;//balance the difference of extending speed and laserSpeed
    if(laserlength > laserMaxlength){
      laserlength = laserMaxlength;//avoid laserLength over laserMaxlength
    }
  }
  else{
    laserX -= laserSpeed;//setting laser's speed
  }
  
  line(laserX, laserY, laserX - laserlength, laserY);
  
  //boundary detection(check if laser out of boundary)
  if(laserX - laserMaxlength < robotX - blockSize*2){
    laserX = robotX + 25;//back to start from robot
    laserlength = 0;//extend laser again
  }
}
