class Morcego extends Inimigo
{
  public Morcego(float tempXP, float tempYP, float tempAltP, float tempLargP, float tempVxP, float tempVyP, String nomeArq, int largPixel, int altPixel, int linhas, int colunas)
  {
    super(tempXP, tempYP, tempAltP, tempLargP, tempVxP, tempVyP, nomeArq, largPixel, altPixel, linhas, colunas);
    
    l = linhas;
    c = colunas;
    imagemP = loadImage(nomeArq);
    spriteP = new PImage [l][c];
    estado = 0;
    //acao = new Timer(2000);
    
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
  
   void movimentoPersonagem() {
     switch(estado) {
       case 0: //Parado
         this.sentido = 0; //Sentido Direita/Parado
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 1; //Parado
         }
         break;
       case 1: //Andar Esquerda
         xP+=3;
         yP-=3;
         this.sentido = 3; //Sentido Esquerda
         if(acao.disparou()) {
           acao = new Timer(4000);
           estado = 2;
         }
         break;
       case 2: //Andar Cima
         xP-=3;
         this.sentido = 0;
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 3;
         }
         break;
       case 3: //Andar Direita Cima
         this.sentido = 1;
         yP+=3;
         xP+=3;
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 0;
         }
         break;
         
     }
  }
}
