class Inimigo extends Personagem {
  int estado;
  int sentido;
  int l, c;
  int altPxl, largPxl;
  Timer acao = new Timer(10);
  
  public Inimigo(float tempXP, float tempYP, float tempAltP, float tempLargP, float tempVxP, float tempVyP, String nomeArq, int largPixel, int altPixel, int linhas, int colunas)
  {
    super(tempXP, tempYP, tempAltP, tempLargP, tempVxP, tempVyP, nomeArq);
    
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
         xP--;
         this.sentido = 3; //Sentido Esquerda
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 2;
         }
         break;
       case 2: //Andar Cima
         yP++;
         this.sentido = 0;
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 3;
         }
         break;
       case 3: //Andar Direita Cima
         this.sentido = 1;
         yP--;
         xP++;
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 0;
         }
         break;
         
     }
  }
  
  void desenhoPersonagem() {
    if (tanima.disparou() == true) {
    quadro = (quadro+1)%3;
    }
  image(spriteP[this.sentido][quadro], xP-cameraX, yP-cameraY, largP, altP);
}
  }
  
  /*boolean colidiu(Personagem personagem)
  {
    float ah,bh,ch,dh;
    float av,bv,cv,dv;
    ah = inimigo1.xP;
    bh = xP + largP;
    ch = personagem.xP;
    dh = personagem.xP + personagem.largP;
    
    av = y;
    bv = y + alt;
    cv = personagem.yP;
    dv = personagem.yP+personagem.altP;
    
    return (ah<dh && ch<bh && av<dv && cv<bv);
    
  }*/
