class Menu
{
  Botao btJogar; //botao jogar
  //Botao btControle; //botao de opções
  Botao btSair; //botao jogar
  Timer tQuadros = new Timer(1000/4);
  
  public  Menu()
  {
    btJogar = new Botao(width/5,  2 * height/5, 3 * width/5, height/8, "Jogar");
    //btControle = new Botao(width/5, 2 * height/5 +100, 3 * width/5, height/8, "Controles");
    btSair = new Botao(width/5, 2 * height/5 +100, 3 * width/5, height/8, "Sair");
  }
  
  void exibir()
  {
    image(fundoMenu, 0, 0, width, height);  
    //btControle.desenhe();
    btJogar.desenhe();
    btSair.desenhe();    
  }
  
  void pressed()
  {
    if(btJogar.mouseSobre()){
      btJogar.destaque();
    }
    /*if(btControle.mouseSobre()){
      btControle.destaque();
    }*/
    if(btSair.mouseSobre()){
      btSair.destaque();
    }
  }
  
  void released()
  {
    if(btJogar.pressionado && btJogar.mouseSobre()){
      tela = 1;
    }
    
    /*if(btControle.pressionado && btControle.mouseSobre()){
      tela = 2;
    }*/
    
    if(btSair.pressionado && btSair.mouseSobre()){
      exit();
    }
    
  btJogar.removeDestaque();
  //btControle.removeDestaque();
  btSair.removeDestaque();
}
  
}
