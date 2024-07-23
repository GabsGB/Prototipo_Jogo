void verificarTelas() {  
    switch (tela) {
      case 0:
        menu.exibir();
        break;
      case 1:
        menuDificuldade.exibir();
        break;
      case 2:
        menuControles.exibir();
        break;
      case 3:
        //rect() //Talvez uma tela Pause?
        break;
      case 4:
        telaMapa1();
        break;
      case 5:
        telaMapa2();
        break;
      case 6:
        telaMapa3();
        break;
      case 7:
        telaMapa4();
      case 10:
        venceuSair();
        break;
    }
}

void venceuSair() {
  background(0,122.5,122.5);
    fill(255);
    text("PARABÉNS!!!!! você venceu (mais atualizações em breve!\n Pressione E para sair)", width * 2/10, height/2, width, height/2);
    if(teclaE) {
      run = false;
    }
}

void perdeu() {
  switch (tela) {
      case 4:
        personagem.xP = 80;
        personagem.yP = 1000;
          personagem.vidaP = 4 - dificuldade;
          personagem.qc1 = personagem.qc2 = personagem.qc3 = 1;
        break;
      case 5:
        personagem.xP = 24 * 32;
        personagem.yP = 36 * 32 - personagem.altP;
        personagem.vidaP = 4 - dificuldade;
        personagem.qc1 = personagem.qc2 = personagem.qc3 = 1;
        break;
      case 6:
        personagem.xP = 12 * 32;
        personagem.yP = 4 * 32;
        personagem.vidaP = 4 - dificuldade;
        personagem.qc1 = personagem.qc2 = personagem.qc3 = 1;
        break;
    }
  }
  
void proximaFase() {
  if(keyPressed) {
    switch (key) {
      case '1':
        tela = 4;
        personagem.xP = 80;
        personagem.yP = 1000;
        break;
      case '2':
        tela = 5;
        personagem.xP = 24 * 32;
        personagem.yP = 36 * 32 - personagem.altP;
        break;
      case '3':
        tela = 6;
        personagem.xP = 12 * 32;
        personagem.yP = 4 * 32;
        break;
      //case '4':
      //  //tela = 4;
      //  //personagem.xP = ;
      //  //personagem.yP = ;
      //  break;
    }
  }
  
  switch (tela) {
    case 4: //Ta Nice!!
      if(personagem.xP >= 44 * 32 && personagem.xP + personagem.largP < 47 * 32) {
        if(personagem.yP + personagem.altP <= 8 * 32){
          tela = 5;
          personagem.xP = 24 * 32;
          personagem.yP = 36 * 32 - personagem.altP;
          invocar = true;
        }
      }
      break;
      
    case 5: //Ta Nice!!
      if(personagem.xP >= 1 * 32 && personagem.xP <= 2 * 32) {
        if(personagem.yP >= 32 * 32 && personagem.yP  <= 35 * 32){
          tela = 6;
          personagem.xP = 12 * 32;
          personagem.yP = 4 * 32;
          invocar = true;
        }
      }
      break;
      
    case 6: //Ta Nice!!
      if(personagem.xP + 4 >= 12 * 32 && personagem.xP <= 13 * 32) {
        if(personagem.yP >= 1 * 32 && personagem.yP < 3 * 32) {
          if(teclaE == true && localItem1.coletado && localItem2.coletado && localItem3.coletado && localItem4.coletado){
            tela = 5;
            personagem.xP = 3 * 32;
            personagem.yP = 33 * 32;
            invocar = true;
          }
        }
      }
      break;
  }
}

//Preto e branco mapa do jogo
/*void funcPixelsPretoBranco() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      int loc = x+y*width;
      float r = red(pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue(pixels[loc]);
      //float d2 = dist(width/2, height/2, x, y);
      
      pixels[loc] = color((r + g + b)/3);
    }
  }
  updatePixels();
}*/

void dicaMapa() {
      switch (dicaMapa) {
        case 1:
          fill(128, 155);
          rect(618, 26, 90, 80);
          fill(255);
          textSize(15);
          text("Objetivo: Siga a estrada", 634, 26, 100, 200);
          textSize(20);
          break;
        case 2:
          fill(128, 155);
          rect(618, 26, 90, 80);
          fill(255);
          textSize(15);
          text("Objetivo: Entre no castelo", 634, 26, 100, 200);
          textSize(20);
          break;
        case 3:
          fill(128, 155);
          stroke(0);
          rect(624, 26, 100, 130);
          fill(255);
          textSize(15);
          text("Siga o gato para a sala do primeiro Fantasma a esquerda", 634, 26, 100, 200);
          textSize(20);
          break;
        case 4:
          fill(128, 155);
          stroke(0);
          rect(624, 46, 100, 150);
          fill(255);
          textSize(15);
          text("Colete os Itens: \n Caveira \n Vela \n Livro \n Mágico", 634, 52, 100, 200);
          break;
        case 5:
          fill(128, 155);
          stroke(0);
          rect(624, 46, 100, 150);
          fill(255);
          textSize(15);
          if(localItem1.coletado && localItem2.coletado && localItem3.coletado)text("Coloque os Itens no circulos: 3/3", 634, 52, 100, 200);
          else if(localItem1.coletado && localItem3.coletado || localItem1.coletado && localItem2.coletado || localItem2.coletado && localItem3.coletado) 
              text("Coloque os Itens no circulos: 2/3", 634, 52, 100, 200);
              else if (localItem1.coletado || localItem2.coletado || localItem3.coletado)
              text("Coloque os Itens no circulos: 1/3", 634, 52, 100, 200);
              else if(localItem1.coletado == false && localItem3.coletado == false && localItem3.coletado == false) text("Coloque os Itens no circulos: 0/3", 634, 52, 100, 200);
          break;
        case 6:
          fill(128, 155);
          stroke(0);
          rect(630, 50, 94, 75);
          fill(255);
          textSize(15);
          text("Ative com o ultimo circulo!", 634, 52, 100, 200);
          break;
      }
}
