float altura = 10;
boolean opcion = false;
float fin = 70.0;
float velocidad = 2;

float posiXpelota = 0;
float posiYpelota = 0;

boolean opcionPelota = false;
float[] posPlayer = new float[2];
float[] posBot = new float[2];
boolean enJuego = true;

int trayectoriaY = 1;

int rebote = 0;

void setup(){
  //fullScreen();
  size(700,400);
  posiXpelota = width/2;
  posiYpelota = height/2;
  strokeWeight(5);
}

void draw(){
  
  if(enJuego){
    background(255);
  
    line(15, mouseY-15, 15, mouseY+45);
    posPlayer[0] = mouseY-15;
    posPlayer[1] =  mouseY+45;
    
    println(posPlayer[0]+" x1 "+posPlayer[1]+" x2");
    bot();
    movePelota();
  } else {
    if(mousePressed){
      enJuego = true;
    }
  }
}


void reiniciarPelota(){
  posiXpelota = width/2;
  posiYpelota = height/2;
  fill(255,0,0);
  ellipse(posiXpelota, posiYpelota, 8, 8);
}

void crash(){

}

void bot(){
  if(altura > 350){
    opcion = false;
  } 
  if(altura < 10) {
    opcion = true;
  }
    
  if(opcion){
    altura = altura + velocidad;
    fin = fin + velocidad;
  } else {
    altura = altura - velocidad;
    fin = fin - velocidad;
  }
  posBot[0] = altura;
  posBot[0] = fin;
  line(690, altura, 690, fin);
}

void movePelota(){
  if(posiXpelota > width-5){
    opcionPelota = false;
  }
  
  if(opcionPelota){
    posiXpelota = posiXpelota + velocidad;
  } else {
    posiXpelota = posiXpelota - velocidad;
  }
  
  if((posPlayer[0] <= posiYpelota && posPlayer[1] >= posiYpelota) && (posiXpelota > 19 && posiXpelota < 23)){
    println("Reboto");
    opcionPelota = true;
    velocidad++;
    rebote = 0;
  }
  
  if((posiYpelota >= posPlayer[0] && posiYpelota <= posPlayer[0]+10) && (posiXpelota > 19 && posiXpelota < 23)){
    rebote = 1;
    println("Arriba");
  }
  
  if((posiYpelota <= posPlayer[1] && posiYpelota >= posPlayer[1]-10) && (posiXpelota > 19 && posiXpelota < 23)){
    rebote = 2;
    println("Abajo");
  }
  
  if( posiXpelota < 10) {
    velocidad = 2;
    reiniciarPelota();
    enJuego = false;
    rebote = 0;
  }
  
  //Y++
  if(rebote == 1){
    posiYpelota += 1;
  }
  //Y--
  if(rebote == 2){
    posiYpelota -= 1;
  }
  
  if(posiYpelota < 6){
    rebote = 1;
  }
  
  if(posiYpelota > 393){
    rebote = 2;
  }
  
  
  //println("X de la pelota: "+posiXpelota+" Y de la pelota: "+posiYpelota);
  fill(0);
  ellipse(posiXpelota, posiYpelota, 8, 8);
}