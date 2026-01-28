public class Rectangle extends Shape {
  public float edgeNormal[][] = {{1, 0}, {0,1}};
  public float vertices[][] = new float[4][2];
  
  public Rectangle(float x, float y, float shapeWidth, float shapeHeight, color shapeColor, String name) {
    super(x, y, shapeWidth, shapeHeight, shapeColor, name);
    updateVertices();
  }
  
  public void updateVertices() {
      float vertex1[] = {-shapeWidth/2, -shapeHeight/2};
      float vertex2[] = {shapeWidth/2, -shapeHeight/2};
      float vertex3[] = {shapeWidth/2, shapeHeight/2};
      float vertex4[] = {-shapeWidth/2, shapeHeight/2}; 
      
      vertices[0] = Matrix.multiply(edgeNormal,vertex1);
      vertices[1] = Matrix.multiply(edgeNormal,vertex2);
      vertices[2] = Matrix.multiply(edgeNormal,vertex3);
      vertices[3] = Matrix.multiply(edgeNormal,vertex4);
      for (float vertex[]: vertices) {
        vertex[0] += x;
        vertex[1] += y;
      }
  }

 public void draw() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    fill(shapeColor);
    rect(0, 0, shapeWidth, shapeHeight);
    popMatrix();
    
    edgeNormal[0][0] = cos(angle);
    edgeNormal[0][1] = -sin(angle);
    edgeNormal[1][0] = sin(angle);
    edgeNormal[1][1] = cos(angle);
    
    updateVertices();
 }
}
