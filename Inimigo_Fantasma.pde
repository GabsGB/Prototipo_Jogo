class Fantasma extends Inimigo {
  public Fantasma (float tempXP, float tempYP, float tempAltP, float tempLargP, float tempVxP, float tempVyP, String nomeArq, int largPixel, int altPixel, int linhas, int colunas)
  {
    super(tempXP, tempYP, tempAltP, tempLargP, tempVxP, tempVyP, nomeArq, largPixel, altPixel, linhas, colunas);
    
    l = linhas;
    c = colunas;
    imagemP = loadImage(nomeArq);
    spriteP = new PImage [l][c];
    estado = 0;
    
    
    altPxl = altPixel;
    largPxl = largPixel;
    largP = largPixel;
    altP = altPixel;
    
    for(int i = 0; i < l; i++) {
      for(int j = 0; j < c; j++) {
        spriteP[i][j] = imagemP.get(j * largPxl, i * altPxl, largPxl, altPxl);
      }
    }
  }
}
