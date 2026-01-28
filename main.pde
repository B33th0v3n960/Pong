Rectangle playerPaddle = new Rectangle(0, 0, 400, 100, #cdd3dd, "Player Paddle");
Rectangle computerPaddle = new Rectangle(0, 0, 400, 100, #cdd3dd, "Computer Paddle");
Circle ball = new Circle(0, 0, 100, #cdd3dd, "Ball");

float ballVelocity[] = {5, 10};
float computerPaddleSpeed = 5;
int playerScore = 0;
int computerScore = 0;

void setup() {
  size(1280, 1440, P2D);
  surface.setTitle("Dumb Game");
  surface.setResizable(true);
  
  noStroke();
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  ellipseMode(CENTER);

  ball.x = width/2;
  ball.y = height/2;

  frameRate(60);  
}

void draw(){
  background(#2e3440);
  textSize(16);
  text("Screen width: " + width, 20, 20);
  text("Screen height: " + height, 20, 40);
  text("Mouse x coordinate: " + mouseX, 20, 60);
  text("Mouse y coordinate: " + mouseY, 20, 80);
  text("Player Score: " + playerScore, 20, 100);
  text("Computer Score: " + computerScore, 20, 120);
  

  if (ball.y < ball.shapeHeight/2) {
    ballVelocity[0] = 0;
    ballVelocity[1] = 10;
    playerScore += 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  else if (ball.y + ball.shapeHeight/2 > height) {
    ballVelocity[0] = 0;
    ballVelocity[1] = -10;
    computerScore += 1;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.x < ball.shapeWidth/2 || ball.x + ball.shapeWidth/2 > width)
    ballVelocity[0] *= -1;

  if (Collision.rectToCircle(playerPaddle, ball) && ball.y < playerPaddle.y - playerPaddle.shapeHeight/2) {
    ballVelocity[0] = 20 * (ball.x - playerPaddle.x )/playerPaddle.shapeWidth;
    ballVelocity[1] *= -1.5 * abs(ball.x - playerPaddle.x) /playerPaddle.shapeWidth;
    ballVelocity[1] -= 15;
  } else if (Collision.rectToCircle(playerPaddle, ball) && ball.y > playerPaddle.y - playerPaddle.shapeHeight/2) {
    ball.x = (ball.x < playerPaddle.x)? playerPaddle.x - playerPaddle.shapeWidth/2 - ball.shapeWidth/2: playerPaddle.x + playerPaddle.shapeWidth/2 + ball.shapeWidth/2;
    ballVelocity[0] *= -1;
  }

  if (Collision.rectToCircle(computerPaddle, ball) && ball.y > computerPaddle.y + computerPaddle.shapeHeight/2) {
    ballVelocity[0] = 20 * (ball.x - computerPaddle.x)/ computerPaddle.shapeWidth;
    ballVelocity[1] *= -1.1;
  } else if (Collision.rectToCircle(computerPaddle, ball) && ball.y < computerPaddle.y + computerPaddle.shapeHeight/2) {
    ball.x = (ball.x < computerPaddle.x)? computerPaddle.x - computerPaddle.shapeWidth/2 - ball.shapeWidth/2: computerPaddle.x + computerPaddle.shapeWidth/2 + ball.shapeWidth/2;
    ballVelocity[0] *= -1;
  }
  ball.x += ballVelocity[0];
  ball.y += ballVelocity[1];

  playerPaddle.y = height - 200;
  playerPaddle.x = mouseX;
  computerPaddle.y = 200;
  
  if (computerPaddle.x + 100 < ball.x) 
    computerPaddle.x += computerPaddleSpeed;
  else if (computerPaddle.x - 100 > ball.x)
    computerPaddle.x -= computerPaddleSpeed;
  
  playerPaddle.draw();
  computerPaddle.draw();
  ball.draw();
}
