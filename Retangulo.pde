class Retangulo {
  float x, y, larg, alt;
  
  public Retangulo(float xa, float ya, float larga, float alta) {
    x = xa;
    y = ya;
    larg = larga;
    alt = alta;
    
  }
  
  void exibir() {
    fill(0);
    rect(x, y, larg, alt);
  }
  
  boolean colidiu(Retangulo retangulo1, Retangulo retangulo2)
  {
    float ah,bh,ch,dh;
    float av,bv,cv,dv;
    
    ah = retangulo1.x;
    bh = retangulo1.x + retangulo1.larg;
    ch = retangulo2.x;
    dh = retangulo2.x + retangulo2.larg;
    
    av = retangulo1.y;
    bv = retangulo1.y + retangulo1.alt;
    cv = personagem.yP;
    dv = personagem.yP+personagem.altP;
    
    return (ah<dh && ch<bh && av<dv && cv<bv);
    
  }
  
}
