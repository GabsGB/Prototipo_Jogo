void telaMapa1() {
  background(0);
  fundo1.exibir(1);
  colisao1.exibir(1); 
  //println(temporizador.segs);
  if(invocar == true)addInimigosMapa1();
  
  for(Inimigo i: inimigosMapa1) {
    slime1.movimento1mapa1();
    slime2.movimento2mapa1();
    slime3.movimento3mapa1();
    slime4.movimento3mapa1();
    
    if(i.colisaoPersonagens(personagem, i)) { //Se personagem Colidiu com oinimigo
      if(timune.disparou()) {
        personagem.colisaoPersonagemInimigo(); //Personagem perde vida
      }
    }
    if(slime1.estado == 0) {
     if(slime1.acao.disparou()){
       slime1.estado = 1;
     }
    }
    i.desenhoPersonagem();
  }
  
  switch (nDialogo) {
    case 2:
      if(personagem.xP >= 23 * 32 && personagem.yP >= 14 * 32) {
          entrada =pressionado =teclaA = teclaW = teclaD = teclaS = false;
        } else {
          personagem.movimentoPersonagem();
          
          
        }
        
      break;
    default:
      personagem.movimentoPersonagem();
  }
  
  personagem.desenhoPersonagem();
  personagem.desenhaVida();
  
  frente1.exibir(1);
  
  if(duraDialogo){
    if(nDialogo == 1){
      entrada = false;
     dialogo1Mapa1.desenha();
     dialogo1Mapa1.escreve();
    }else entrada = true;
  }
  
  if(personagem.xP >= 23 * 32) {
    if(personagem.yP >= 13 * 32 && personagem.yP  <= 18 * 32) {
      if(nDialogo == 2){
        entrada = false;
        dialogo2Mapa1.desenha();
        dialogo2Mapa1.escreve();
      }else entrada = true;
    }
  }
  
  dicaMapa = nDialogo -1;
  if(nDialogo != 1)dicaMapa();
    
  proximaFase();
  
}
