class Player{
  float x, y;
  PImage spriteSheet;
  PImage spray[][];
  boolean inMotion;
  int currentDirection;
  float currentFrame;
  
  final int UP = 0, LEFT = 1, DOWN = 2, RIGHT = 3;
  
  Player(){
    inMotion = false;
    currentDirection = 1;
    currentFrame = 0;
    x = width / 2;
    y = height / 2;
    setupSprite();
  }
  
  void setupSprite(){
    spray = new PImage[4][9];
    spriteSheet = loadImage("manGasCan.png");
    
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 9; j++){
        spray[i][j] = spriteSheet.get(14 + 52 * j, 9 + 53 * i, 29, 43);
      }
    }
  }
  
  void drawPlayer(){
    if(inMotion){
      image(spray[currentDirection][1 + int(currentFrame)], x, y);
    }
    else{
      image(spray[currentDirection][0], x, y);
    }
  }
  
  void updatePlayer(int xDelta, int yDelta){
    currentFrame = (currentFrame + 0.2) % 8;
    inMotion = true;
    
    if(xDelta == 0 && yDelta == 0){
      inMotion = false;
    }
    else if(xDelta == -1){
      currentDirection = LEFT;
    }
    else if(xDelta == 1){
      currentDirection = RIGHT;
    }
    else if(yDelta == -1){
      currentDirection = UP;
    }
    else if(yDelta == +1){
      currentDirection = DOWN;
    }
    
    x += xDelta;
    y += yDelta;
    
    if(isPlayerOffScreen()){
      x -= xDelta;
      y -= yDelta;
    }
  }
  
  boolean isPlayerOffScreen(){
    if((x < 0) || (x + 29 > width)||
       (y < 0) || (y + 43 > height)){
      return true;
    }
    return false;
  }
  
  boolean manDies(float a, float b){
    if((abs(a - (x + spray[0][0].width / 2)) < 28) && (abs(b - (y + spray[0][0].height / 2)) < 28)){
      return true;
    }
    return false;
  }
}
