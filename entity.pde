class Player {
  public float x = 0;
  public float y = 0;
  public Rectangle hitBox = null;
  private int life = 0;
  private int score = 0;
  private float velocity[] = new float[2];

  public Player(float x, float y, float playerWidth, float playerHeight, int life, String name) {
    hitBox = new Rectangle(x, y, playerWidth, playerHeight, #cdd3dd, "String");
  }

  public void move(float destinationX, float destinationY) {
    if (x + velocity[0] < destinationX && x >= 0)
      x += velocity[0];
    else if (x - velocity[0] > destinationX)
      x -= velocity[0];

    if (y + velocity[1] < destinationY && x <= width)
      y += velocity[1];
    else if (y - velocity[1] > destinationY)
      y -= velocity[1];
    
    this.hitBox.x = this.x;
    this.hitBox.y = this.y;
  }
}

class Ball {
  public float x = 0;
  public float y = 0;
  float velocity[] = new float[2];
  Circle hitBox;

  public Ball(float x, float y, float ballWidth, String name){
    hitBox = new Circle(x, y, ballWidth, #cdd3dd, name);
  }

  public void move() {
    x += velocity[0];
    y += velocity[1];
    this.hitBox.x = x;
    this.hitBox.y = y;
  }

  public void velocityMult(float scalar) {
    velocity = Vector.scalarMul(scalar, velocity);
  }

  public void reflectVelocityX() {
    velocity[0] *= -1;
  }

  public void reflectVelocityY() {
    velocity[1] *= -1;
  }
}
