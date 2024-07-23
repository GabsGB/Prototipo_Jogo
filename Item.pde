class Item {
  float x, y, larg, alt, largP, altP;
  PImage imagem;
  PImage [] sprite;
  int quadro;
  boolean colidiu;
  boolean coletado;
  int quantosQuadros;
  
  Timer tanima = new Timer(2500/4);
  
  
  public Item( float tempX, float tempY, float tempLarg, float tempAlt, String nomeArq, int tempQtsQuadros) {
    x = tempX;
    y = tempY;
    largP = tempLarg;
    altP = tempAlt;
    larg = alt = 32;
    coletado = false;
    imagem = loadImage(nomeArq);
    quadro = 1;
    quantosQuadros = tempQtsQuadros;
    sprite = new PImage [3];
    
    for(int i = 0; i < 3; i++) {
      sprite[i] = imagem.get(i*int(largP), 0, int(largP), int(altP));
    }

 }
 
 void desenha() {
   image(sprite[quadro], x-cameraX, y-cameraY, larg, alt);
   
 }
 
 void colisaoItemPersonagem() {
   if (colisaoIP() == true){
      image(sprite[0], x-cameraX, y-cameraY, larg, alt);
  }
 }
 boolean colisaoIP() {
  return (x < personagem.xP + personagem.largP/2 && personagem.xP < x + larg && y < personagem.yP+personagem.altP && personagem.yP < y +  alt);
 }
 
 void itemColeta(Item i) {
   if(colisaoIP() && teclaE) {
     i.coletado = true; 
   }
 }
}
