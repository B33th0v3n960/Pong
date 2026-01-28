public class Ellipse extends Shape {  
  public Ellipse(float x, float y, float shapeWidth, float shapeHeight, color shapeColor, String name)  {
    super(x, y, shapeWidth, shapeHeight, shapeColor, name);
  }
  
  public void draw() {
    fill(shapeColor);
    ellipse(x, y, shapeWidth, shapeHeight);
  } 
}

public class Circle extends Ellipse {
  public Circle(float x, float y, float shapeWidth, color shapeColor, String name) {
    super(x, y, shapeWidth, shapeWidth, shapeColor, name);
  }
}
