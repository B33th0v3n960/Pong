public class Shape {
  public float x = 0;
  public float y = 0;
  public float shapeWidth = 0;
  public float shapeHeight = 0;
  public float angle = 0;
  public color shapeColor = #000000;
  public PShape baseShape;
  
  private String name = "Shape";
  
  public Shape(float x, float y, float shapeWidth, float shapeHeight, color shapeColor, String name) {
    this.x = x;
    this.y = y;
    this.shapeWidth = shapeWidth;
    this.shapeHeight = shapeHeight;
    this.shapeColor = shapeColor;
    
    this.name = name;
  }
  
  public void info() {
    System.out.println(name + " coordinates: " + x + "," + y);
    System.out.println(name + " width: " + shapeWidth);
    System.out.println(name + " color: " + shapeColor);
  }
}
