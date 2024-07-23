void telaMapa4() {
  background(0);
  fundo4.exibir(1);
  colisao4.exibir(1);
  
  //if(invocar == true)addInimigosMapa4();
 
  personagem.desenhoPersonagem();
  personagem.desenhaVida();
  
  /*if(localItem4.coletado) {
    if(qF<12){
      image(fogoSprite[qF/4][qF%4], 8 * 32 - cameraX, 13 * 32 - cameraY, 32, 32);
      if(tfogo.disparou())qF = qF+1;
        } else {
          localItem4.quadro = 2;
        }
      }*/
  
  frente4.exibir(1);
  
  proximaFase();
  
  pet.desenhoPersonagem();
  
  dicaMapa();
  dicaMapa = nDialogo -1;
  //Dialogo 4
  /*if(localItem4.coletado == true) {
    if(localItem4.quadro == 2) {
      if(duraDialogo) {
        if(nDialogo == 7) {
         entrada = false;
         dialogo4Mapa3.desenha();
         dialogo4Mapa3.escreve();
       } else {
         entrada = true;
         tela = 10;
       }
      }
    }
  }*/
  
}
