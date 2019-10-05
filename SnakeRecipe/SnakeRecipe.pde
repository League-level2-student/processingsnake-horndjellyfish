
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.
class Segment {

  //2. Create x and y member variables to hold the location of each segment.
  int x;
  int y;
  // 3. Add a constructor with parameters to initialize each variable.
  Segment(int x, int y) {
    this.x = x;
    this.y = y;
  }

  // 4. Add getter and setter methods for both the x and y member variables.
  public int getX() {
    return this.x;
  }
  void setX(int x) {
    this.x = x;
  }
  public int getY() {
    return this.y;
  }
  void setY(int y) {
    this.y = y;
  }
}

// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment snakeHead = new Segment(20, 20);


// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String direction = "up";


// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int foodEaten = 0;


// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX = ((int)random(500));
int foodY = ((int)random(500));
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

//int foodX = ((int)random(50)*10);



void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
}

// 11. Use the frameRate(int rate) method to set the rate to 20.

int rate;
int frameRate(int rate) {
  this.rate = rate;
  return rate = 20;
}

void draw() {

  background(0);


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
 if (snakeX >= foodX-5 && snakeX <= foodX+15 && snakeY >= foodY-5 && snakeY <= foodY+15) {
  manageTail();
 }
  drawFood();
  drawSnake();
  move();
  collision();
}



// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  fill(255, 0, 0);
  rect(foodX, foodY, 10, 10);
}



//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  fill(0, 255, 0);
  rect(snakeX, snakeY, 10, 10);

  //test your code
}

int snakeX = 250;
int snakeY = 250;
// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:

  switch(direction) {
  case "up":
    snakeY = snakeY - 3;
    break;
  case "down":
    snakeY = snakeY + 3;
    break;
  case "left":
    snakeX = snakeX - 3; 
    break;
  case "right":
    snakeX = snakeX + 3; 
    break;
  }



  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}



// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if (keyCode == UP) {
    direction = "up";
  }
  if (keyCode == DOWN) {
    direction = "down";
  }
  if (keyCode == LEFT) {
    direction = "left";
  }
  if (keyCode == RIGHT) {
    direction = "right";
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if (snakeX <= 0) {
    snakeX = 490;
  }
  if (snakeX >= 500) {
    snakeX = 10;
  }
  if (snakeY <= 0) {
    snakeY = 490;
  }
  if (snakeY >= 500) {
    snakeY = 10;
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {
  //System.out.println("snakeX: " + snakeX);
  //System.out.println("foodX: " + foodX);
  if (snakeX >= foodX-5 && snakeX <= foodX+15 && snakeY >= foodY-5 && snakeY <= foodY+15) {
    foodEaten = foodEaten + 1;
    System.out.println("food eaten: " + foodEaten);
    foodX = ((int)random(490));
    foodY = ((int)random(490));
  }
  textSize(20);
  fill(255, 255, 255);
  text("score: " + foodEaten, 400, 20);
  // If the segment is colliding with a piece of food...
  // Increase the amount of food eaten and set foodX and foodY to new random locations.
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment> segs = new ArrayList();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  Segment a = new Segment(snakeX, snakeY);
  segs.add(a);
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  while (segs.size() > foodEaten) {
    segs.remove(0);
  }
}

void drawTail() {
  // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
  for (Segment mySeg:segs) {
    fill(0, 255, 0);
    rect(mySeg.getX(), mySeg.getY(), 10, 10);
  }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for (Segment mySeg : segs) {
    if (mySeg.getX() >= snakeX+10 && mySeg.getY() >= snakeY+10) {
      foodEaten = 0;
    }
  }
  // reset your food variable

  //Call this method at the beginning of your manageTail method.
}
