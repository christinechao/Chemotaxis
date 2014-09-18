Heart HeartOne, HeartTwo, HeartThree;
Heart [] colony;

void setup()   
{  
  frameRate(18);   
  size(1200, 700);
  HeartOne = new Heart (10, 10, 36, 255/2, 255);  
  HeartTwo = new Heart (150, 24, 150, 255/2, 255);
  HeartThree = new Heart (150, 24, 247, 255/2, 255);

  colorMode(HSB);
  colony = new Heart[500];
  for (int i=0; i< colony.length; i++) {
    int h = (int)(Math.random()*255);
    int x = (int)(Math.random()*1300);
    int y = (int)(Math.random()*700);
    colony[i] = new Heart(x, y, h, 255/2, 255);
  }

}

void draw()   
{ 
  background(255);
  HeartOne.jump();
  HeartOne.show();
  HeartTwo.jump();
  HeartTwo.show();
  HeartThree.jump();
  HeartThree.show();

  for (int i=0; i< colony.length; i++) {
    colony[i].walk();
    colony[i].show();
  }
}  

void mousePressed() {
  redraw();
}
class Heart    
{
  int myX, myY, myR, myG, myB;  
  Heart(int x, int y, int r, int g, int b)
  {
    myR = r;
    myG = g;
    myB = b;
    myX = x;
    myY = y;
  } 
  void walk() {
    myX = myX + (int)(Math.random()*7)-3;
    myY = myY + (int)(Math.random()*7)-3;
  }

  void jump() {
    myX =(int)(Math.random()*1300);
    myY =(int)(Math.random()*700);
  }

  void show() {
    fill(myR, myG, myB, 150); 
    smooth();
    noStroke();
    beginShape();
    vertex(myX, myY);
    bezierVertex(myX, myY-20, myX+40, myY-10, myX, myY+25); 
    vertex(myX, myY); 
    bezierVertex(myX, myY-20, myX-40, myY-10, myX, myY+25); 
    endShape();
  }
}  
