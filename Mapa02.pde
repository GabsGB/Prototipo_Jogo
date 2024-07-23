void telaMapa2() {
  background(0);
  if(invocar == true)addInimigosMapa2();
  fundo2.exibir(1);
  colisao2.exibir(1);
  
  if(pet.xP >= 2 * 32) {
    pet.desenhoPersonagem();
  }
  
  personagem.desenhoPersonagem();
  personagem.desenhaVida();
  proximaFase();
  dicaMapa();
  frente2.exibir(1);
  
  switch (nDialogo) {
    case 3:
      if(entrada)personagem.movimentoPersonagem();
      pressionado = false;
      teclaA = teclaW = teclaD = teclaS = false;
      entrada = false;
      dialogo1Mapa2.desenha();
      dialogo1Mapa2.escreve();
      break;
    default:
      personagem.movimentoPersonagem();
      entrada = true;
  }
  
  if(pet.xP >= 1 * 32 && nDialogo == 4) {
    //pet.movimentoPersonagem();
    pet.xP--;
    pet.sentido = 3;
  }
  
  dicaMapa = nDialogo -1;
  if(nDialogo != 1)dicaMapa();
  
  
  
}
  
