public static class Vector {
  public static float dotProduct(float vector1[], float vector2[]) {
    if (vector1 != null && vector2 != null && vector1.length == vector2.length) {
      float result = 0.0;
      for (int element = 0; element < vector1.length; element++) {
        result += vector1[element] * vector2[element];
      }
      return result;
    }
    return 0.0;
  }
  
  public static float magnitude(float vector[]) {
    if (vector != null){
      float magnitudeSquared = 0;
      for (int element = 0; element < vector.length; element++) {
        magnitudeSquared += vector[element] * vector[element];
      }
      return sqrt(magnitudeSquared);
    }
    return 0.0;
  }
  
  public static float[] addition(float vector1[], float vector2[]) {
    if (vector1 != null && vector2 != null && vector1.length == vector2.length) {
      float result[] = new float[vector1.length];
      for (int element = 0; element < vector1.length; element++) {
        result[element] = vector1[element] + vector2[element];
      }

      return result;
    }
    return null;
  }

  public static float[] scalarMul(float scalar, float vector[]){
    if (vector != null){
      float result[] = new float[vector.length];
      for (int element = 0; element < vector.length; element++) {
        result[element] = vector[element] * scalar;
      }
      return result;
    }
    return null;
  }
  
  public static float[] projection(float[] projVector, float[] inputVector){
     if(projVector != null && inputVector != null && projVector.length == inputVector.length) {
       float scalarCoefficient = dotProduct(projVector, inputVector) * (1 / pow(magnitude(projVector), 2));
       return scalarMul(scalarCoefficient, projVector);
     }
     return null;
  }
  
}
