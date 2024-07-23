class Geleia extends Inimigo {
  public Geleia(float tempXP, float tempYP, float tempAltP, float tempLargP, float tempVxP, float tempVyP, String nomeArq, int largPixel, int altPixel, int linhas, int colunas)
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
    
  void movimento1mapa1() {
    
    //Sentido 0 Cima
    //Sentido 1 Direita
    //Sentido 2 Baixo
    //Sentido 3 Esquerda
    
     switch(estado) {
       //Parado
       case 0: 
         this.sentido = 2; //Sentido Direita/Parado
         if(acao.disparou()) {
           acao = new Timer(4000);
           estado = 1; //Parado
         }
         break;
         
       //Andar Direita
       case 1: 
         if(xP <= 20 * 32)xP+=1;
         this.sentido = 1; //Sentido Direita
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 2;
         }
         break;
         
       //Andar Sobe
       case 2: 
         if(yP >= 20 * 32)yP-=1;
         this.sentido = 0; //Sentido Cima
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 3;
         }
         break;
         
       //Andar Esqueda
       case 3: 
         this.sentido = 3;
         if(xP >= 2 * 32 )xP-=1;
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 4;
         }
         break;
         
       //Andar Desce
       case 4: 
         this.sentido = 2;
         if(yP <= 22 * 32)yP+=1;
         if(acao.disparou()) {
           acao = new Timer(500);
           estado = 0;
         }
         break;
     }
  }
  
  void movimento2mapa1() {
    
    //Sentido 0 Cima
    //Sentido 1 Direita
    //Sentido 2 Baixo
    //Sentido 3 Esquerda
    
     switch(estado) {
       //Parado
       case 0: 
         this.sentido = 2; //Sentido Direita/Parado
         if(acao.disparou()) {
           acao = new Timer(2000);
           estado = 1; //Parado
         }
         break;
         
       //Andar Sobe
       case 1: 
         if(yP >= 2 * 32)yP-=1;
         this.sentido = 0;
         if(acao.disparou()) {
           acao = new Timer(3000);
           estado = 2;
         }
         break;
         
       //Andar Direita
       case 2: 
         if(xP <= 20 * 32)xP+=1;
         this.sentido = 1;
         if(acao.disparou()) {
           acao = new Timer(3000);
           estado = 3;
         }
         break;
         
       //Andar Desde
       case 3: 
         this.sentido = 2;
         if(yP <= 22 * 32 )yP+=1;
         if(acao.disparou()) {
           acao = new Timer(1500);
           estado = 4;
         }
         break;
         
       //Andar Esquerda
       case 4: 
         this.sentido = 3;
         if(xP >= 19 * 32)xP-=1;
         if(acao.disparou()) {
           acao = new Timer(1000);
           estado = 0;
         }
         break;
     }
  }
  
  void movimento3mapa1() {
    
    //Sentido 0 Cima
    //Sentido 1 Direita
    //Sentido 2 Baixo
    //Sentido 3 Esquerda
    
     switch(estado) {
       //Parado
       case 0: 
         this.sentido = 2;
         if(acao.disparou()) {
           acao = new Timer(1500);
           estado = 1; //Parado
         }
         break;
         
       //Andar desce
       case 1: 
         if(yP <= 20 * 32)yP+=1;
         this.sentido = 2;
         if(acao.disparou()) {
           acao = new Timer(1000);
           estado = 2;
         }
         break;
         
       case 2: 
         this.sentido = 0;
         if(acao.disparou()) {
           acao = new Timer(1000);
           estado = 3; //Parado
         }
         break;  
       //Andar Sobe
       case 3: 
         if(yP >= 13 * 32)yP-=1;
         this.sentido = 0;
         if(acao.disparou()) {
           acao = new Timer(1500);
           estado = 0;
         }
         break;
         
       //Andar Desde
       //Parado
       
     }
  }
    
}
