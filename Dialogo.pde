class Dialogo {
  float xQuad, yQuad, largQuad, altQuad;
  float xTexto, yTexto, largTexto, altTexto;
  int numIni, numFinal, index;
  String[] textoLinhas;
  int numDialogo;
  Timer tDialogo = new Timer(2000/4);
  
  public Dialogo(int lInicial, int lFinal) {
    textoLinhas = loadStrings("textoMapas.txt");
    xQuad = 10;
    xTexto =  xQuad * 3;
    yQuad = yTexto = height * 5/ 7;
    largQuad = largTexto = width - 20;
    altQuad = altTexto = height;
    index = numIni = lInicial;
    numFinal = lFinal;
  }
  
  void desenha() {
    fill(255/2.5);
    rect(xQuad, yQuad, largQuad, altQuad);
  }
  
  void escreve() {
    fill(255);
    textSize(14);
    textAlign(LEFT);
    
    text(textoLinhas[index], xTexto, height * 5/ 7 + 25, largTexto, altTexto);
      if(teclaEnter == true && index < numFinal - 1) {
        //println(index);        
        index++;
        teclaEnter = false;
      }
      if(teclaEnter == true && index == numFinal - 1) {
        duraDialogo = false;
        nDialogo++;
      }
      duraDialogo = true;
    }
    
} 
