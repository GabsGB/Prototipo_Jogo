void addInimigosMapa1() {
  
  inimigosMapa1 = new ArrayList<Inimigo>();
  
  slime1 = new Geleia(2 * 32, 22 * 32, 32*3/4, 32*3/4, 4, 4, "inimigo1.png", 32, 32, 4, 3);
  slime2 = new Geleia(19 * 32, 22 * 32, 32*3/4, 32*3/4, 4, 4, "inimigo1.png", 32, 32, 4, 3);
  slime3 = new Geleia(26 * 32, 13 * 32, 32*3/4, 32*3/4, 4, 4, "inimigo1.png", 32, 32, 4, 3);
  slime4 = new Geleia(35 * 32, 20 * 32, 32*3/4, 32*3/4, 4, 4, "inimigo1.png", 32, 32, 4, 3);
  
  
  inimigosMapa1.add(slime1); //Slime 1 Mapa 1
  inimigosMapa1.add(slime2); //Slime 2 Mapa 1
  inimigosMapa1.add(slime3); //Slime 3 Mapa 1
  inimigosMapa1.add(slime4); //Slime 4 Mapa 1
  slime3.estado = 3;
  
  tContador = new Timer(1000);
  
  invocar = false;
}

void addInimigosMapa2() {
  
  musicaMapa.pause();
  musicaMapa = m.loadFile("musicaMapa2.mp3");
  musicaMapa.loop();
  
  pet.xP = 24 * 32;
  pet.yP = 33 * 32;
  pet.sentido = 4;
  pet.quadro = 1;
  
  //inimigosMapa2 = new ArrayList<Inimigo>();
  
  //inimigosMapa2.add(pet);
  
  invocar = false;
}

void addInimigosMapa3() {
  
  musicaMapa.pause();
  
  inimigosMapa3 = new ArrayList<Inimigo>();
  
  chefe1 = new Fantasma(8 * 32 - 3, 12 * 32 + 5, 32*3/4, 32*3/4, 4, 4, "inimigo2.png", 40, 46, 4, 3); //Fantasma 1 mapa 3
  
  pet.xP = 13 * 32;
  pet.yP = 3 * 32;
  pet.sentido = 4;
  pet.quadro = 1;
  
  qF = 0;
  
  inimigosMapa3.add(chefe1);
  inimigosMapa3.add(pet);
  
  chefe1.sentido = 2;
  
  musicaMapa = m.loadFile("musicaMapa3.mp3");
  musicaMapa.loop();
  
  tContador = new Timer(1000);
  
  temporizador = new Contador(3 /*Minuto Inicial*/, 0 /*Segundo Inicial*/, 0 /*Minuto Final*/, 0 /*Segundo Final*/);
  
  invocar = false;
}
