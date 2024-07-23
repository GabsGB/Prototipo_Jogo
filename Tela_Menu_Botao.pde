class Botao{
  int x, y;
  String texto;
  int lar,alt;
  boolean pressionado;
  PImage []spritesBotao;
  int quadroBotao;
  Timer ani;
  
  public Botao(int x, int y, int lar, int alt, String texto){
    this.x=x;
    this.y=y;
    ani = new Timer(500);
    this.lar=lar;
    this.alt=alt;
    this.texto=texto;
    pressionado=false;
    this.quadroBotao = 0;
    this.spritesBotao = new PImage [4];
    
    for(int i = 0; i < spritesBotao.length; i++) {
      spritesBotao[i] = loadImage("menuBtn1."+ i +".png");
    }
    
  }
  
  boolean mouseSobre(){
    return (mouseX>x&&mouseX<x+lar&&mouseY>y&&mouseY<y+alt);
  }
  
  void destaque(){
    pressionado=true;
  }
  
  void removeDestaque(){
    pressionado=false;
  }
  
  void desenhe(){
    boolean disparou = ani.disparou();
    if(pressionado) {
      if(quadroBotao < 3)quadroBotao++;
    }
    else if(mouseSobre() == true){
      if(disparou)
      {
        if(quadroBotao != 1 && quadroBotao != 0)
        {
          quadroBotao=0;
        }
        else quadroBotao = 1 - quadroBotao;
      }
    }
        else quadroBotao = 1;
    
    image(spritesBotao[quadroBotao], x, y, lar, alt);
    
    fill(120);
    textAlign(CENTER,CENTER);
    textSize(30);
    text(texto,x,y,lar,alt);
  }
}
