class Personagem {
  float xP;
  float yP;
  float altP;
  float largP;
  float posiAntes, posiAtual;
  boolean moveuCima, moveuBaixo, moveuDireita, moveuEsquerda;
  int sentido;
  Retangulo hitbox;
  
  float largVP;
  float altVP;
  int vidaP;
  
  int quadro; //Diz qual quadro de animação
  int quadroVP;
  
  Timer tanima = new Timer(500/4);
  Timer tvida = new Timer(500/4);
  
  PImage imagemP;
  PImage imagemVP;
  
  float vxP;
  float vyP;
  float alcance;
  
  boolean colidiuInimigo;
  
  PImage img;
  
  PImage[][] spriteP;
  //PImage[][] spriteVP;
  PImage[] spriteVP;
  float centro;
  
  int qc1, qc2, qc3;
  
  Personagem(float tempXP, float tempYP, float tempAltP, float tempLargP, float tempVxP, float tempVyP, String nomeArq) {
    xP = tempXP;
    yP = tempYP;
    altP = tempAltP;
    largP = tempLargP;
    vxP = tempVxP;
    vyP = tempVyP;
    spriteP = new PImage[4][3];
    spriteVP = new PImage [5];
    quadro = 0;
    qc1=qc2=qc3=1; 
    largVP = 64;
    altVP = 64;
    posiAntes = posiAtual = 0;
    
    //alcance = 25; //Raio
    vidaP = 3 - dificuldade;
    
    imagemP = loadImage(nomeArq);
    
    for(int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        spriteP[i][j] = imagemP.get(j * 48, i * 64, 48, 64);
    }    
   }
   
   imagemVP = loadImage("animacaoVP.png");
   hitbox = new Retangulo(xP-cameraX + 7, yP - cameraY + 9, largP - 14, altP - 10);
   
      for (int j = 0; j < 5; j++) {
        spriteVP[j] = imagemVP.get(0, j*64, 64, 64);
    }
   
   
 }

void desenhoPersonagem() {
  if (pressionado == true) {
    if (tanima.disparou() == true) quadro = (quadro+1)%3;
  }
  image(spriteP[sentido][quadro], xP-cameraX, yP-cameraY, largP, altP);
}

void desenhaVida() {
  
  if(tvida.disparou())
  {
    
    if(vidaP==2)
    {
      if(qc3<4)qc3++;  
    }
    
    if(vidaP==1)
    {
      if(qc3<4)qc3++;
      if(qc2<4)qc2++;
    }
    
    if(vidaP==0)
    {
      if(qc3<4)qc3++;
      if(qc2<4)qc2++;
      if(qc1<4)qc1++;
      perdeu();
    }
    
  }
  
  switch(dificuldade) {
    case 1:
      fill(255, 200);
      rect(10, 10, largVP/2 * 5, altVP/2);
      image(spriteVP[qc1], 10 , 10, largVP/2, altVP/2);
      image(spriteVP[qc2], 10 + largVP, 10, largVP/2, altVP/2);
      image(spriteVP[qc3], 10 + 2 * largVP, 10, largVP/2, altVP/2);
      break;
    case 2:
      fill(255, 200);
      rect(10, 10, largVP/2 * 3, altVP/2);
      image(spriteVP[qc1], 10 , 10, largVP/2, altVP/2);
      image(spriteVP[qc2], 10 + largVP, 10, largVP/2, altVP/2);
      break;
    case 3:
      fill(255, 200);
      rect(10, 10, largVP/2, altVP/2);
      image(spriteVP[qc1], 10 , 10, largVP/2, altVP/2);
      break;
  }
}

//Vida do personagem 
void colisaoPersonagemInimigo() {
    vidaP--;
    timune = new Timer(3000);
}

void movimentaY() {
  if(teclaW) {
    yP -= vyP;;
    moveuCima = true;
  } else if(teclaS) {
    yP += vyP;
    moveuBaixo = true;
  }
}

void movimentaX()
{
  if(teclaA){
    xP-=vxP;
    moveuEsquerda=true;
  }
  else if(teclaD){
    xP+=vxP;
    moveuDireita=true;
  }
}
 
boolean colisaoPersonagens(Personagem p, Inimigo i) {
  float ah,bh,ch,dh;
  float av,bv,cv,dv;
  
    ah = p.xP + 7;
    bh = p.xP + 7 + p.largP - 14;
    ch = i.xP;
    dh = i.xP + i.largP;
    
    av = p.yP + 9;
    bv = p.yP + 9 + p.altP - 10;
    cv = i.yP;
    dv = i.yP + i.altP;
    
    return (ah<dh && ch<bh && av<dv && cv<bv);
}

//DETECÇÃO COLISÃO
boolean colidiuCenario(Camada colisao){
    int xi,xf,yi,yf;
    
    xi= (int)(xP + 7)/colisao.tLar ;
    xf= (int)(xP + 7 + largP -1 -14)/colisao.tLar;
    yi= (int)(yP + 9)/colisao.tAlt;
    yf= (int)(yP + 9 + altP - 1 -10)/colisao.tAlt;
    
    if(xi<0)xi=0;
    if(xi>colisao.lar-1) xi=colisao.lar-1;
    if(xf<0)xf=0;
    if(xf>colisao.lar-1) xf=colisao.lar-1;
    
    if(yi<0)yi=0;
    if(yi>colisao.alt-1) yi=colisao.alt-1;
    if(yf<0)yf=0;
    if(yf>colisao.alt-1) yf=colisao.alt-1;
    
    for(int i=xi; i<=xf;i++){
      for(int j=yi; j<=yf; j++){
        if(colisao.get(j,i)!=-1) return true;
      }
    }
    return false;
  }

void movimentoPersonagem() {     
      /*
      verificarTeclaA();
      verificarTeclaD();
    */
    movimentaX();
    //MARGEM DA TELA <-- Inicio -->
    if(xP > cameraX + width - margem - largP){ //DIREITA      
      cameraX = xP - width+margem + largP;
    }
    
    if(cameraX > xP - margem) { //ESQUERDA
        cameraX = xP - margem;
    }
    
    if(yP > cameraY+height-margem-altP){
      cameraY = yP-height+margem+altP;
    }
    
    if(cameraY > yP - margem) {
      cameraY = yP - margem;
    }
    //MARGEM DA TELA <-- Fim -->
    
    //COLISAO DO PERSONAGEM COM CENÁRIO/TILE !!!
    //Tratamento colisão X e largura
    switch (tela) {
      case 4:
        if(personagem.colidiuCenario(colisao1))
        { 
          if(moveuDireita) xP -= (xP + largP - 7)%colisao1.tLar;
          else if(moveuEsquerda) xP += colisao1.tLar - ((xP + 7)%colisao1.tLar);
        }
        break;
        
      case 5:
        if(personagem.colidiuCenario(colisao2))
        { 
          if(moveuDireita) xP -= (xP + largP - 7)%colisao2.tLar;
          else if(moveuEsquerda) xP += colisao2.tLar - ((xP + 7)%colisao2.tLar);
        }
        break;
        
      case 6:
        if(personagem.colidiuCenario(colisao3))
        { 
          if(moveuDireita) xP -= (xP + largP - 7)%colisao2.tLar;
          else if(moveuEsquerda) xP += colisao2.tLar - ((xP + 7)%colisao2.tLar);
        }
        break; 
    }
    
    movimentaY();
    
    //Tratamento colisão Y e altura
    switch (tela) {
      case 4:
        if(personagem.colidiuCenario(colisao1))
        { 
          
          if(moveuCima) yP += colisao1.tAlt - ((yP + 9)%colisao1.tAlt);
          else if(moveuBaixo) yP -= ((yP + altP -1)%colisao1.tLar);
          
        }
        break;
      case 5:
        if(personagem.colidiuCenario(colisao2))
        { 
          //if(moveuCima) yP += personagem.vxP + colisao2.tAlt - ((yP + 9)%colisao2.tAlt) + 0.5;
          //else if(moveuBaixo) yP -= ((yP + altP -1)%colisao2.tLar) + personagem.vyP + 0.1;
          if(moveuCima) yP += colisao2.tAlt - ((yP + 9)%colisao2.tAlt);
          else if(moveuBaixo) yP -= ((yP + altP -1)%colisao2.tLar);
        }
        break;
      case 6:
        if(personagem.colidiuCenario(colisao3))
        { 
          //if(moveuCima) yP += personagem.vxP + colisao3.tAlt - ((yP + 9)%colisao3.tAlt) + 0.5;
          //else if(moveuBaixo) yP -= ((yP + altP -1)%colisao3.tLar) + personagem.vyP + 0.1;
          if(moveuCima) yP += colisao3.tAlt - ((yP + 9)%colisao3.tAlt);
          else if(moveuBaixo) yP -= ((yP + altP -1)%colisao3.tLar);
        }
        break;
      
    }
    
    moveuCima = moveuBaixo = moveuDireita = moveuEsquerda = false;
}

}
