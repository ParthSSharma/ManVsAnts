class Ant{
  float x, y;
  PVector speed;
  PImage img;
  boolean exist = true;
  
  Ant(){
    x = random(30, 570);
    y = random(30, 570);
    while((((width / 2) - 40) < x) && (x < ((width / 2) + 40)) && (((height / 2) - 40) < y) && (y < ((height / 2) + 40))){
      x = random(30, 570);
      y = random(30, 570);
    }
    img = loadImage("ant.png");
    speed = new PVector(random(-0.8, 0.8), random(-0.8, 0.8));
  }
  
  void drawAnt(){
    if(!exist){
      x = -100;
      y = -100;
      speed.x = 0;
      speed.y = 0;
    }
    
    moveAnt();
    pushMatrix();
    translate(x + img.width / 2, y + img.height / 2);
    rotate(speed.heading() + PI / 2);
    translate(-img.width / 2, -img.height / 2);
    image(img, 0, 0);
    popMatrix();
  }
  
  void moveAnt(){
    float testMove = random(0, 1);
    
    if(testMove < 0.1){
      speed.rotate(random(-0.3, 0.3));
    }
    else if(testMove > 0.97){
      speed.rotate(random(-1, 1));
    }
    
    x += speed.x;
    y += speed.y;
    
    if(isAntOffScreen()){
      x -= speed.x;
      y -= speed.y;
      speed.rotate(random(-2, 2));
    }
  }
  
  boolean isAntOffScreen(){
    if((x < 5) || (x + 30 > width)||
       (y < 5) || (y + 30 > height)){
      return true;
    }
    return false;
  }
}
