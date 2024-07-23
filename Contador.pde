class Contador{
  int mins, segs, minF, segF;
  String textoContador;
  
  public Contador(int tempMinI, int tempSegI, int tempMinF,int tempSegF) {
    mins = tempMinI;
    segs = tempSegI;
    minF = tempMinF;
    segF = tempSegF;
  }
  
  void contadorDiminui() {
    if(mins >= minF && segs >= segF) {
      if(tContador.disparou()) {
        
        if(segs == 0) {
          mins--;
          segs = 59;
          tContador = new Timer(1000);
        } else {
          segs--;
          tContador = new Timer(1000);  
      }
    }
    
    if(mins < 10) {
        if(segs < 10) {
          textoContador = "0" + mins + ":" + "0" + segs;
        }else {
          textoContador = "0" + mins + ":" + segs;
        }
      }else {
        if(segs < 10) {
          textoContador = mins + ":" + "0" + segs;
        }else {
          textoContador = mins + ":" + segs;
        }
      }
      
    }
    
  }
  
  boolean diminuiDisparou() {
    return(mins == minF && segs == segF);
  }
  
  boolean aumentaDisparou() {
    return(minF >= mins && segF >= segs);
  }
  
  void contadorAumenta() {
    
    if(minF >= mins && segF >= segs) {
      
      if(tContador.disparou()) {
        segs+=1;
        tContador = new Timer(1000);
        if(segs%60 == 0) {
          mins++;
          segs = 0;
        }
      }
    
    if(mins < 10) {
        
      if(segs < 10) {
        textoContador = "0" + mins + ":" + "0" + segs;
       } else {
         textoContador = "0" + mins + ":" + segs;
       }
       
      } else {
        
        if(segs < 10) {
          textoContador = mins + ":" + "0" + segs;
        }else {
          textoContador = mins + ":" + segs;
        }
        
      }
      
      fill(0, 255, 0);
      text(textoContador, width/2, height/2);
    }
    
  }
  
  void contadorExibir() {
    textSize(20);
    fill(120, 150);
    rect(width/2 - 5, height/12, 70, 50);
    fill(255);
    text(textoContador, width/2, height/8);    
  }
  
 }
