Player human = new Player(0, 0, 400, 100, 3, "Human Player");
Player computer = new Player(0, 0, 400, 100, 3, "Computer Player");
Ball ball = new Ball(500, 600, 100, "Ball");
Rectangle menu = new Rectangle(0, 0, 640, 720, #d8dee9, "Menu");

boolean pause = false;

void setup() {
  size(1280, 1440, P2D);
  surface.setTitle("Pong");
  surface.setResizable(true);
  
  noStroke();
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  ellipseMode(CENTER);

  ball.x = width/2;
  ball.y = height/2;
  human.velocity[0] = 20;
  computer.velocity[0] = 5;
  ball.velocity[0] = 5;
  ball.velocity[1] = 10;

  frameRate(60);  
}

void draw(){
  background(#2e3440);
  if (!pause) {
    if (keyPressed) {
      if (key == 'P' || key == 'p') {
        pause = true;
        delay(100);
      }
    }

    textSize(24);
    text("Player Score: " + human.score, 20, 20);
    text("Computer Score: " + computer.score, 20, 40);

    if (ball.y < ball.hitBox.shapeHeight/2) {
      ball.velocity[1] = 10;
      human.score += 1;
      ball.x = width/2;
      ball.y = height/2;
    }
    else if (ball.y + ball.hitBox.shapeHeight/2 > height) {
      ball.velocity[1] = -10;
      computer.score += 1;
      ball.x = width/2;
      ball.y = height/2;
    }

    if (ball.x < ball.hitBox.shapeWidth/2 || ball.x + ball.hitBox.shapeWidth/2 > width)
      ball.velocity[0] *= -1;

    if (Collision.rectToCircle(human.hitBox, ball.hitBox) && ball.y < human.hitBox.y - human.hitBox.shapeHeight/2) {
      ball.velocity[0] = 20 * (ball.x - human.hitBox.x )/human.hitBox.shapeWidth;
      ball.velocity[1] *= -1.2 * abs(ball.x - human.hitBox.x) /human.hitBox.shapeWidth;
      ball.velocity[1] -= 10;
    } else if (Collision.rectToCircle(human.hitBox, ball.hitBox) && ball.y > human.hitBox.y - human.hitBox.shapeHeight/2) {
      if ( ball.x < human.hitBox.x) {
        ball.x = human.hitBox.x - human.hitBox.shapeWidth/2 - ball.hitBox.shapeWidth/2;
        ball.velocity[0] -= human.velocity[0];
      }
      else {
        ball.x = human.hitBox.x + human.hitBox.shapeWidth/2 + ball.hitBox.shapeWidth/2;
        ball.velocity[0] -= computer.velocity[0];
      }
      ball.velocity[0] *= -1;
    }

    if (Collision.rectToCircle(computer.hitBox, ball.hitBox) && ball.y > computer.hitBox.y + computer.hitBox.shapeHeight/2) {
      ball.velocity[0] = 20 * (ball.x - computer.hitBox.x)/ computer.hitBox.shapeWidth;
      ball.velocity[1] *= -1.2 * abs(ball.x - computer.hitBox.x) /computer.hitBox.shapeWidth;
      ball.velocity[1] += 10;
    } else if (Collision.rectToCircle(computer.hitBox, ball.hitBox) && ball.y < computer.hitBox.y + computer.hitBox.shapeHeight/2) {
      if (ball.x < computer.hitBox.x) {
        ball.x = computer.hitBox.x - computer.hitBox.shapeWidth/2 - ball.hitBox.shapeWidth/2;
        ball.velocity[0] -= computer.velocity[0];
      }
      else {
        ball.x = computer.hitBox.x + computer.hitBox.shapeWidth/2 + ball.hitBox.shapeWidth/2;
        ball.velocity[0] += computer.velocity[0];
      }
      ball.velocity[0] *= -1;
    }


    human.y = height - 200;
    human.move(mouseX, human.y);
    computer.y = 200;
    computer.move(ball.x, computer.y);
    
    human.hitBox.draw();
    computer.hitBox.draw();
    ball.move();
    ball.hitBox.draw();
  } else {
    menu.x = width/2;
    menu.y = height/2;
    menu.draw();
    textSize(48);
    fill(#2e3440);
    text("Game Paused", width/2 - 100, height/2);
    
    if (keyPressed) {
      if (key == 'P' || key == 'p') {
        pause = false;
        delay(100);
      }
    }
  }
}
