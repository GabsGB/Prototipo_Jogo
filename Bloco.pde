class Bloco
{
  float x,y;
  float larg, alt;
  
  public Bloco(float xi, float yi, float la, float al)
  {
    x = xi;
    y = yi;
    larg = la;
    alt = al;
  }
  
  boolean colidiu(Personagem personagem)
  {
    float ah,bh,ch,dh;
    float av,bv,cv,dv;
    
    ah = x;
    bh = x + larg;
    ch = personagem.xP;
    dh = personagem.xP + personagem.largP;
    
    av = y;
    bv = y + alt;
    cv = personagem.yP;
    dv = personagem.yP+personagem.altP;
    
    return (ah<dh && ch<bh && av<dv && cv<bv);
    
  }
  
  void exibir()
  {
    //fill(0,200,0);
    //rect(x-cameraX,y-cameraY,larg,alt);
  }
}
