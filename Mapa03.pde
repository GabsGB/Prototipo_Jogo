void telaMapa3() {
  background(0);
  fundo3.exibir(1);
  colisao3.exibir(1);
  
  //Evento Único - Ínicio da Fase
  if(invocar == true)addInimigosMapa3();
  
  //Repetição para todos os ITENS (não circulos) do mapa 
  for(Item it: itensMapa1) {
      if(it.coletado == false) {
        it.desenha();    
        it.itemColeta(it);
        it.colisaoItemPersonagem();
      }
    }

  //Repetição para todos os CÍRCULOS (não itens) do mapa
  for(Item c: circulosMapa1) {
    c.desenha();
    localItem4.desenha();
    if(item1.coletado == true && item2.coletado == true && item3.coletado == true) {      
      if(c.coletado == false) {
        c.colisaoItemPersonagem();
        c.itemColeta(c);
      }
      
      if(localItem4.colisaoIP() && teclaE)tfogo = new Timer(2000/12);
      
      if(localItem1.coletado == true) {
        item1.x = localItem1.x;
        item1.y = localItem1.y;
        item1.desenha();
      }
      
      if(localItem2.coletado == true) {
        item2.x = localItem2.x;
        item2.y = localItem2.y;
        item2.desenha();
      }
      if(localItem3.coletado == true) {
        item3.x = localItem3.x;
        item3.y = localItem3.y;
        item3.desenha();
      }
      
      if (localItem1.coletado == true && localItem2.coletado == true && localItem3.coletado == true) {
        if(localItem4.coletado == false){
          localItem4.colisaoItemPersonagem();
          localItem4.itemColeta(localItem4);
        }
      }
      
  }
 }
 
  personagem.desenhoPersonagem();
  personagem.desenhaVida();
  
  //Desenha o Fanstasma
  if(localItem4.quadro != 2)chefe1.desenhoPersonagem();
  
  //Desenha o Fogo
  if(localItem4.coletado) {
    if(qF<12){
      image(fogoSprite[qF/4][qF%4], 8 * 32 - cameraX, 13 * 32 - cameraY, 32, 32);
      if(tfogo.disparou())qF = qF+1;
        } else {
          localItem4.quadro = 2;
        }
      }
      
  pet.desenhoPersonagem(); //Desenha Pet
  frente3.exibir(1); //Camada Frente
  
  proximaFase();
  
  dicaMapa();
  dicaMapa = nDialogo -1;
  
  //Dialogo 1
  switch (nDialogo) {
    case 4:
      pressionado = false;
      teclaA = teclaW = teclaD = teclaS = false;
      entrada = false;
      dialogo1Mapa3.desenha();
      dialogo1Mapa3.escreve();
      break;
    default:
      personagem.movimentoPersonagem();
      entrada = true;
  }
  
  //Dialogo 2
  if(item1.coletado == true && item2.coletado == true && item3.coletado == true) {
    if(duraDialogo){
        if(nDialogo == 5){
          entrada = false;
          dialogo2Mapa3.desenha();
          dialogo2Mapa3.escreve();
        }else entrada = true;
      }
  }else {
    stroke(255);
    if(item2.coletado) {
      strokeWeight(2);
      line(639, 110, 693, 110);
      strokeWeight(1);
    }
    if(item3.coletado) {
      strokeWeight(2);
      line(643, 135, 668, 135);
      strokeWeight(1);
    }
    if(item1.coletado) {
      strokeWeight(2);
      line(641, 158, 678, 158);
      line(635, 183, 685, 183);
      strokeWeight(1);
    }
  }
  
  //Dialogo 3
  if(localItem1.coletado == true && localItem2.coletado == true && localItem3.coletado == true) {
    if(duraDialogo) {
      if(nDialogo == 6) {
       entrada = false;
       dialogo3Mapa3.desenha();
       dialogo3Mapa3.escreve();
      }else entrada = true;
    }
  }
  
  //Dialogo 4
  if(localItem4.coletado == true) {
    if(localItem4.quadro == 2) {
      if(duraDialogo) {
        if(nDialogo == 7) {
         entrada = false;
         dialogo4Mapa3.desenha();
         dialogo4Mapa3.escreve();
       } else {
         entrada = true;
         //tela = 10;
       }
      }
    }
  }
  
  temporizador.contadorDiminui();
  temporizador.contadorExibir();
  
  if(temporizador.diminuiDisparou()) {
    personagem.xP = 12 * 32;
    personagem.yP = 4 * 32;
    nDialogo = 4;
    
    for(Item it: itensMapa1) {
      it.coletado = false;
    }
    for(Item ci: circulosMapa1) {
      ci.coletado = false;
    }
  }
  
}
