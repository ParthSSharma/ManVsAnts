ArrayList <Ant> ants = new ArrayList<Ant>();
ArrayList <Spray> sprays = new ArrayList<Spray>();

boolean keys[];
Spray spray;
int numAnts = 5;
Player player;
PImage bg;
boolean gameOver = false;
int score = 0;

void setup(){
  size(600, 600);
  frameRate(60);
  bg = loadImage("grass.png");
  player = new Player();
  keys = new boolean[128];
  spray = new Spray(-100, -100, 1);
  
  for(int i = 0; i < numAnts; i++){
    ants.add(new Ant());
  }
}

void draw(){
  image(bg, 0, 0);
  score = numAnts - ants.size();
  textSize(15);
  fill(0);
  text("Points: " + score, 5, 15);
  move();
  player.drawPlayer();
  spray.drawSpray();
  
  if(ants.size() == 0){
    textSize(32);
    fill(0);
    text("YOU WIN!", 230, 320);
  }
  
  for(int i = 0; i < ants.size(); i++){
    ants.get(i).drawAnt();
    if(player.manDies((ants.get(i).x + ants.get(i).img.width / 2), (ants.get(i).y + ants.get(i).img.height / 2))){
      player.x = -100;
      player.y = -100;
      gameOver = true;
    }
    
    for(int j = 0; j < sprays.size(); j++){
      if(sprays.get(j).checkAnt((ants.get(i).x + ants.get(i).img.width / 2), (ants.get(i).y + ants.get(i).img.height / 2))){
        ants.get(i).exist = false;
        ants.remove(i);
        break;
      }
    }
  }
  for(int i = 0; i < sprays.size(); i++){
    sprays.get(i).drawSpray();
    if(sprays.get(i).currentDuration >= sprays.get(i).maxDuration){
      sprays.remove(i);
    }
  }
  
  if(gameOver){
    textSize(32);
    fill(0);
    text("GAME OVER!", 210, 320);
  }
}

void move(){
  int xDelta = 0;
  int yDelta = 0;
  
  if(keys['a']){
    xDelta -= 1;
  }
  if(keys['d']){
    xDelta += 1;
  }
  if(keys['w']){
    yDelta -= 1;
  }
  if(keys['s']){
    yDelta += 1;
  }
  if(keys[' ']){
    sprays.add(new Spray(player.x, player.y, player.currentDirection));
  }
  
  player.updatePlayer(xDelta, yDelta);
}

void keyPressed(){
  keys[key] = true;
}

void keyReleased(){
  keys[key] = false;
}
