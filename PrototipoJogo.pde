//VARIAVEIS GLOBAIS

//Fonts
PFont fontTtl;
PFont fontTxt;

//Sons e musicas
import ddf.minim.*;
Minim m;
AudioPlayer musicaMapa;

//Camera
float cameraX, cameraY;
float margem;

//Timer fechar a tela
Timer fimJogo = new Timer(3000);
Timer delay = new Timer(1500);
Timer timune = new Timer(2000/4);

//Jogo
boolean run;
int dificuldade;
Timer tContador;
Contador temporizador;

//Mapa
Camada fundo1, fundo2, fundo3, fundo4;
Camada colisao1, colisao2, colisao3, colisao4;
Camada frente1, frente2, frente3, frente4;
PImage tileset1, tileset2, tileset3, tileset4;
int dicaMapa;

//Dialogos
boolean duraDialogo;
int nDialogo;
Dialogo dialogo1Mapa1, dialogo2Mapa1, dialogo1Mapa2, dialogo1Mapa3, dialogo2Mapa3, dialogo3Mapa3, dialogo4Mapa3;

//Inimigos
ArrayList<Inimigo> inimigosMapa1, inimigosMapa2, inimigosMapa3;
Geleia slime1, slime2, slime3, slime4;
Fantasma chefe1;
boolean invocar;

//Telas ou Cenário
int tela;
//Obejto Tela ou Cenário
Menu menu;
Menu_Dificuldade menuDificuldade;
Menu_Controles menuControles;

//PImage [] mapas;
PImage mapa;
PImage fundoMenu;

//Imagem Fogo
int qF;
PImage fogoImagem;
PImage [] []fogoSprite;
Timer tfogo;

//Input
boolean teclaW, teclaA, teclaS, teclaD, teclaE, teclaEnter;
boolean pressionado;
float clickX, clickY;
boolean clicou;
boolean entrada;

//Dialogo
int cont;

//Objeto Personagem
Personagem personagem;
//Objeto Inimigo
Inimigo pet;

//Objeto Itens
Item itemA, item1, item2, item3;
Item localItem1, localItem2, localItem3, localItem4;
ArrayList<Item> itensMapa1, circulosMapa1;

//Sprites
PImage [] personagens = new PImage[2];

//SETUP
void setup() {
  size(800, 600);
  cameraX=0;
  cameraY=0;
  margem = 150;
  run = true;
  entrada = true;

  m = new Minim(this);
  musicaMapa = m.loadFile("musicaMapa1.mp3");
  musicaMapa.loop(); //Tocar a musica

  fundoMenu = loadImage("fundomenu.png");
  fogoSprite = new PImage [3] [4];

  addItens();

  frameRate(120);
  
  fontTxt = createFont("Comic Sans MS", 32);
  fontTtl = createFont("Constantia", 32);
  
  personagem = new Personagem(80, 1000, 64*3/4, 48*3/4, 1, 1, "animacaoP.png");

  pet = new Inimigo(24 * 32, 33 * 32, 32 * 3/4, 32 * 3/4, 4, 4, "cat.png", 32, 32, 5, 4);
  
  temporizador = new Contador(3 /*Minuto Inicial*/, 0 /*Segundo Inicial*/, 0 /*Minuto Final*/, 0 /*Segundo Final*/);
  
  invocar = true;

  tela = 0;

  dificuldade = 1;

  menu = new Menu();

  menuDificuldade = new Menu_Dificuldade();
  
  menuControles = new Menu_Controles();

  personagem.sentido = 0;

  dicaMapa = 1;

  tileset1 = loadImage("tilesetMapa1.png");
  tileset2 = loadImage("tilesetMapa2.png");
  tileset3 = loadImage("tilesetMapa3.png");
  tileset4 = loadImage("tilesetMapa4.png");

  fundo1 = new Camada(/*Quantos tiles de largura*/50, /*Quantos tiles de altura*/ 38, /*Nome do arquivo*/ "fundoMapa1", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset1, /*Quantos Tiles tem na linha*/ 52);
  colisao1 = new Camada(/*Quantos tiles de largura*/50, /*Quantos tiles de altura*/ 38, /*Nome do arquivo*/ "colisaoMapa1", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset1, /*Quantos Tiles tem na linha*/ 52);
  frente1 = new Camada(/*Quantos tiles de largura*/50, /*Quantos tiles de altura*/ 38, /*Nome do arquivo*/ "frenteMapa1", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset1, /*Quantos Tiles tem na linha*/ 52);

  fundo2 = new Camada(/*Quantos tiles de largura*/50, /*Quantos tiles de altura*/ 38, /*Nome do arquivo*/ "fundoMapa2", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset2, /*Quantos Tiles tem na linha*/ 129);
  colisao2 = new Camada(/*Quantos tiles de largura*/50, /*Quantos tiles de altura*/ 38, /*Nome do arquivo*/ "colisaoMapa2", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset2, /*Quantos Tiles tem na linha*/ 129);
  frente2 = new Camada(/*Quantos tiles de largura*/50, /*Quantos tiles de altura*/ 38, /*Nome do arquivo*/ "frenteMapa2", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset2, /*Quantos Tiles tem na linha*/ 129);

  fundo3 = new Camada(/*Quantos tiles de largura*/25, /*Quantos tiles de altura*/ 19, /*Nome do arquivo*/ "fundoMapa3", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset3, /*Quantos Tiles tem na linha*/ 146);
  colisao3 = new Camada(/*Quantos tiles de largura*/25, /*Quantos tiles de altura*/ 19, /*Nome do arquivo*/ "colisaoMapa3", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset3, /*Quantos Tiles tem na linha*/ 146);
  frente3 = new Camada(/*Quantos tiles de largura*/25, /*Quantos tiles de altura*/ 19, /*Nome do arquivo*/ "frenteMapa3", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset3, /*Quantos Tiles tem na linha*/ 146);

  fundo4 = new Camada(/*Quantos tiles de largura*/25, /*Quantos tiles de altura*/ 19, /*Nome do arquivo*/ "fundoMapa4", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset4, /*Quantos Tiles tem na linha*/ 31);
  colisao4 = new Camada(/*Quantos tiles de largura*/25, /*Quantos tiles de altura*/ 19, /*Nome do arquivo*/ "colisaoMapa4", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset4, /*Quantos Tiles tem na linha*/ 31);
  frente4 = new Camada(/*Quantos tiles de largura*/25, /*Quantos tiles de altura*/ 19, /*Nome do arquivo*/ "frenteMapa4", /*32x32*/ 32, 32, /*Nome do arquivo*/ tileset4, /*Quantos Tiles tem na linha*/ 31);

  dialogo1Mapa1 = new Dialogo(0, 5);
  dialogo2Mapa1 = new Dialogo(5, 7);
  dialogo1Mapa2 = new Dialogo(7, 14);
  dialogo1Mapa3 = new Dialogo(14, 22);
  dialogo2Mapa3 = new Dialogo(22, 23);
  dialogo3Mapa3 = new Dialogo(23, 26);
  dialogo4Mapa3 = new Dialogo(26, 27);
  
  fogoImagem = loadImage("fogoSprites.png");
  
  for(int l = 0; l < 3; l++) {
      for(int c = 0; c < 4; c++) {
        fogoSprite[l][c] = fogoImagem.get(c * 16, l * 24, 16, 24);
      }
    }
  
  cont  = 0;

  nDialogo = 1;
  duraDialogo = true;
  
  textFont(fontTxt);
}

void mousePressed() {
  clickX = mouseX;
  clickY = mouseY;
  //println("MouseX: " + mouseX + "MouseY: " + mouseY);

  clicou = true;
  if (tela == 0)menu.pressed();
  if (tela == 1)menuDificuldade.pressed();
  if (tela == 2)menuControles.pressed();
}

void mouseReleased() {
  clicou = false;
  clickX = 0;
  clickY = 0;
  if (tela == 0)menu.released();
  if (tela == 1)menuDificuldade.released();
  if (tela == 2)menuControles.released();
}

void keyPressed() {
  switch(keyCode) {
    case ENTER:
      teclaEnter = true;
      break;
  }
  if (entrada) {
    switch (keyCode) {
    case UP:
      teclaW = true;
      pressionado = true;
      personagem.sentido = 0; //Cima      
      break;
    case LEFT:
      teclaA = true;
      pressionado = true;
      personagem.sentido = 3; //Esquerda
      break;
    case DOWN:
      teclaS = true;
      pressionado = true;
      personagem.sentido = 2; //Baixo
      break;
    case RIGHT:
      teclaD = true;
      pressionado = true;
      personagem.sentido = 1; //Direita
      break;
  }
    switch (key) {
    case 'w':
    case 'W':
      teclaW = true;
      pressionado = true;
      personagem.sentido = 0; //Cima
      break;
    case 's':
    case 'S':
      teclaS = true;
      pressionado = true;
      personagem.sentido = 2; //Baixo
      break;
    case 'a':
    case 'A':
      teclaA = true;
      pressionado = true;
      personagem.sentido = 3; //Esquerda
      break;
    case 'd':
    case 'D':
      teclaD = true;
      pressionado = true;
      personagem.sentido = 1; //Direita
      break;
    case 'e':
    case 'E':
      teclaE = true;
      break;
    /*case 'p':
    case 'P':
      tela = 0;
      break;*/
    }
  }
}

void keyReleased() {
  switch (keyCode) {
    case ENTER:
      teclaEnter = false;
      break;
    case UP:
      teclaW = false;
      pressionado = false;
      break;
    case LEFT:
      teclaA = false;
      pressionado = false;
      break;
    case DOWN:
      teclaS = false;
      pressionado = false;
      break;
    case RIGHT:
      teclaD = false;
      pressionado = false;
      break;
  }
  switch (key) {
    case 'w':
    case 'W':
      teclaW = false;
      pressionado = false;
      break;
    case 'a':
    case 'A':
      teclaA = false;
      pressionado = false;
      break;
    case 's':
    case 'S':
      teclaS = false;
      pressionado = false;
      break;
    case 'd':
    case 'D':
      teclaD = false;
      pressionado = false;
      break;
    case 'e':
    case 'E':
      teclaE = false;
      break;
    case 'm':
    case 'M':
      personagem.vidaP--;
      break;
    }
}



//Jogo
void draw() {

  //Rodar o jogo
  if (run == true) {
    verificarTelas();
  }

  if (run == false) {
    exit();
  }
}
