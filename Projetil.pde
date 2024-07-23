class Projetil {
  PVector pos;
  PVector vel;
  public Projetil(float xi, float yi, float v)
  {
    pos = new PVector(xi,yi);
    vel = new PVector(personagem.xP + personagem.largP/2, personagem.yP + personagem.altP/2);
    vel.sub(pos);
    vel.setMag(v);
  }
  void movimentar()
  {
    pos.add(vel);
  }
  void exibir()
  {
    ellipse(pos.x-cameraX, pos.y-cameraY, 10, 10);
  }
}
