class Menu_Dificuldade {
  Botao btFacil;   //botao jogar
  Botao btMedio;   //botao de opções
  Botao btDificil; //botao jogar
  Botao btVoltar;   //botao Voltar
  
  public  Menu_Dificuldade()
  {
    btFacil = new Botao(width/5, 2 * height/5 - 20, 3 * width/5, height/8, "Fácil");
    btMedio = new Botao(width/5, 2 * height/5 + 80, 3 * width/5, height/8, "Médio");
    btDificil = new Botao(width/5, 2 * height/5 + 180, 3 * width/5, height/8, "Difícil");
    btVoltar = new Botao(width/5, 2 * height/5 + 275, 3 * width/5, height/8, "Voltar");
  }
  
  void exibir()
  {
    image(fundoMenu, 0, 0, width, height);  
    btFacil.desenhe();
    btMedio.desenhe();
    btDificil.desenhe();
    btVoltar.desenhe();  
  }
  
  void pressed()
  {
    if(btFacil.mouseSobre()){
      btFacil.destaque();
    }
    if(btMedio.mouseSobre()){
      btMedio.destaque();
    }
    if(btDificil.mouseSobre()){
      btDificil.destaque();
    }
    if(btVoltar.mouseSobre()){
      btVoltar.destaque();
    }
  }
  
  void released()
  {
    if(btVoltar.pressionado && btVoltar.mouseSobre()){
      tela = 0;
    }
    if(btFacil.pressionado && btFacil.mouseSobre()){
      dificuldade = 1;
      tela = 2;
    }
    
    if(btMedio.pressionado && btMedio.mouseSobre()){
      dificuldade = 2;
      tela = 2;
    }
    
    if(btDificil.pressionado && btDificil.mouseSobre()){
      dificuldade = 3;
      tela = 2;
    }
    
    btFacil.removeDestaque();
    btMedio.removeDestaque();
    btDificil.removeDestaque();
    btVoltar.removeDestaque();
  }
}
