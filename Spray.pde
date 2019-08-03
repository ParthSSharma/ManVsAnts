class Spray{
  float x, y;
  float cenX, cenY;
  int p;
  float currentDuration;
  float maxDuration;
  
  Spray(float x, float y, int p){
    this.x = x;
    this.y = y;
    this.p = p;
    maxDuration = 120;
    currentDuration = 1;
  }
  
  void drawSpray(){
    if(currentDuration < maxDuration){
      float alphaValue = (currentDuration / maxDuration) * 150;
      noStroke();
      fill(0, 255, 255, 150 - alphaValue);
      if(p == 0){
        cenX = x + 12;
        cenY = y - 30;
        ellipse(cenX, cenY, 40 - currentDuration / 5, 40 - currentDuration / 5);
      }
      else if(p == 2){
        cenX = x + 15;
        cenY = y + 70;
        ellipse(cenX, cenY, 40 - currentDuration / 5, 40 - currentDuration / 5);
      }
      else if(p == 1){
        cenX = x - 25;
        cenY = y + 25;
        ellipse(cenX, cenY, 40 - currentDuration / 5, 40 - currentDuration / 5);
      }
      else if(p == 3){
        cenX = x + 50;
        cenY = y + 25;
        ellipse(cenX, cenY, 40 - currentDuration / 5, 40 - currentDuration / 5);
      }
      
      currentDuration++;
    }
  }
  
  boolean checkAnt(float a, float b){
    if((abs(a - cenX) < 15) && (abs(b - cenY) < 15)){
      return true;
    }
    return false;
  }
}
