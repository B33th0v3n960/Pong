public static class Collision {
  public static boolean cirlceToCircle(Circle circle1, Circle circle2) {
    if (circle1 != null && circle2 != null) {
        float centreToCentre[] = { circle2.x - circle1.x, circle2.y - circle1.y};
        float distanceBetweenCentre = Vector.magnitude(centreToCentre);
        return distanceBetweenCentre < circle1.shapeWidth/2 + circle2.shapeWidth/2;
    }
    return false;
  }
  
  public static boolean rectToRect(Rectangle rectangle1, Rectangle rectangle2) {
    if (rectangle1 != null && rectangle2 != null) {
      float topRectangle1 = 0.0;
      float botRectangle1 = 0.0;
      float topRectangle2 = 0.0;
      float botRectangle2 = 0.0;
      float projection1 = 0.0;
      float projection2 = 0.0;  
      
      for (int column = 0; column < rectangle1.edgeNormal[0].length; column++) {
        float axis[] = {rectangle1.edgeNormal[0][column], rectangle1.edgeNormal[1][column]};

        for (int vertex = 0; vertex < rectangle1.vertices.length; vertex++) {
          if ( axis[0] != 0) {
            projection1 = Vector.projection(axis,rectangle1.vertices[vertex])[0] / axis[0];
            projection2 = Vector.projection(axis,rectangle2.vertices[vertex])[0] / axis[0];
          } else {
            projection1 = Vector.projection(axis,rectangle1.vertices[vertex])[1] / axis[1];
            projection2 = Vector.projection(axis,rectangle2.vertices[vertex])[1] / axis[1];
          }
          
          if (vertex == 0) {
            topRectangle1 = projection1;
            botRectangle1 = projection1;
            topRectangle2 = projection2;
            botRectangle2 = projection2;
          }  
          topRectangle1 = (projection1 > topRectangle1)? projection1: topRectangle1;
          botRectangle1 = (projection1 < botRectangle1)? projection1: botRectangle1;
          topRectangle2 = (projection2 > topRectangle2)? projection2: topRectangle2;
          botRectangle2 = (projection2 < botRectangle2)? projection2: botRectangle2;
        }

        if (!(topRectangle1 > botRectangle2 && topRectangle2 > botRectangle1))
          return false;      
      }
      
      for (int column = 0; column < rectangle2.edgeNormal[0].length; column++) {
        float axis[] = {rectangle2.edgeNormal[0][column], rectangle2.edgeNormal[1][column]};
        for (int vertex = 0; vertex < rectangle2.vertices.length; vertex++) {
          if ( axis[0] != 0) {
            projection1 = Vector.projection(axis,rectangle1.vertices[vertex])[0] / axis[0];
            projection2 = Vector.projection(axis,rectangle2.vertices[vertex])[0] / axis[0];
          } else {
            projection1 = Vector.projection(axis,rectangle1.vertices[vertex])[1] / axis[1];
            projection2 = Vector.projection(axis,rectangle2.vertices[vertex])[1] / axis[1];
          }
          
          if (vertex == 0) {
            topRectangle1 = projection1;
            botRectangle1 = projection1;
            topRectangle2 = projection2;
            botRectangle2 = projection2;
          }
          topRectangle1 = (projection1 > topRectangle1)? projection1: topRectangle1;
          botRectangle1 = (projection1 < botRectangle1)? projection1: botRectangle1;
          topRectangle2 = (projection2 > topRectangle2)? projection2: topRectangle2;
          botRectangle2 = (projection2 < botRectangle2)? projection2: botRectangle2;
        }
        if (!(topRectangle1 > botRectangle2 && topRectangle2 > botRectangle1))         
          return false;
      }
      return true;
    }
    return false;
  }
  
  public static boolean rectToCircle(Rectangle rectangle, Circle circle) {
    if (rectangle != null && circle != null) {
      for (int column = 0; column < rectangle.edgeNormal[0].length; column++){
        float axis[] = {rectangle.edgeNormal[0][column], rectangle.edgeNormal[1][column]};
        float rectangleCenter[] = {rectangle.x, rectangle.y};
        float circleCenter[] = {circle.x, circle.y};
        float projection1 = 0.0;
        float projection2 = 0.0;
        float topRectangle = 0.0;
        float botRectangle = 0.0;
        float topCircle = 0.0;
        float botCircle;
        
        for (int vertex = 0; vertex < rectangle.vertices.length; vertex++) {
          if ( axis[0] != 0) 
            projection1 = Vector.projection(axis,rectangle.vertices[vertex])[0] / axis[0];
          else 
            projection1 = Vector.projection(axis,rectangle.vertices[vertex])[1] / axis[1];
          
          if (vertex == 0) {
            topRectangle = projection1;
            botRectangle = projection1;
          }

          topRectangle = (projection1 > topRectangle)? projection1: topRectangle;
          botRectangle = (projection1 < botRectangle)? projection1: botRectangle;
        }

        if ( axis[0] != 0) 
          projection2 = Vector.projection(axis, circleCenter)[0] / axis[0];
        else 
          projection2 = Vector.projection(axis,circleCenter)[1] / axis[1];
        topCircle = projection2 + circle.shapeWidth/2;
        botCircle = projection2 - circle.shapeWidth/2;

        if (!(topRectangle > botCircle && topCircle > botRectangle))         
          return false;

      }

      for (float vertex[]: rectangle.vertices)  {
        float distance = sqrt(pow(circle.x - vertex[0], 2) + pow(circle.y - vertex[1], 2));
        if (distance < circle.shapeWidth/2)
          return true;
      }
      return true;
    }
    return false;
  }
}
