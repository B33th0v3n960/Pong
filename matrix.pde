public static class Matrix {
  public static float[] multiply(float matrix[][], float vector[]) {
    if (matrix != null && vector != null && matrix[0].length == vector.length){
      float result[] = new float[matrix.length];
      for (int row = 0; row < matrix.length; row++) {
        result[row] = Vector.dotProduct(matrix[row], vector);
      }
      return result;
    }
    return null;
  }
}
