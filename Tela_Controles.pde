class Menu_Controles {
  Botao btAvancar;   //botao Voltar
  PImage controleImage1, controleImage2;
  int imagemExibir;
  
  public  Menu_Controles()
  {
    btAvancar = new Botao(width/5, 2 * height/5 + 220, 3 * width/5, height/8, "Avançar");
    controleImage1 = loadImage("controleImagem.png");
    controleImage2 = loadImage("controleImagem2.png");
    imagemExibir = 1;
  }
  
  void exibir()
  {
    image(fundoMenu, 0, 0, width, height);
    if(imagemExibir == 1) {
      image(controleImage1, 60.5, 60, 679, 480);
    }
    else {
      image(controleImage2, 0, 0, width, height);
    }
    btAvancar.desenhe();  
  }
  
  void pressed()
  {
    if(btAvancar.mouseSobre()){
      btAvancar.destaque();
    }
  }
  
  void released()
  {    
    if(btAvancar.pressionado && btAvancar.mouseSobre()){
      if(imagemExibir == 1) {
        imagemExibir = 2;
      } else {
        tela = 4;
      }
  }
  
    btAvancar.removeDestaque();
  }
}
