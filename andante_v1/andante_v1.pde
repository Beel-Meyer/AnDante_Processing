PImage fondo; 
PImage paraguasimagen; 
PImage menu;
PImage instruc;
PImage ganar;
PImage perder;
PImage contPaciencia;
PImage contTiempo;
PImage contTiempoAutito;
PImage botonJugar;
PImage botonCred;


int posX, posY, desX; //posicion del famoso
int veloci; //velocidad del famoso
int pepit2; //tiempo hasta que cambia de direccion el famoso 
int desap; //random para que algunas gotas desaparezcan y otras no cuando tocan paraguas
boolean enoja; //si el famoso se enoja o no
int paciencia = 10;
int tiempoenojado; //changüí para que no se enoje tan rápido

int XFondo; // posicion en X del fondo

boolean jugando, ganaste, perdiste, famosoinicial, inicio, reglas, credis;
int tiempojuego;
//String izquierda;

import fisica.*;
import gifAnimation.*;
Gif famosogifderecha;
Gif famosogifizquierda;

Gif famosoespera;

FWorld world;
FCircle paraguas;
FBox obstacle;
FBox famoso;
FBox lluvia;
FPoly parag;


void setup() {
  size(1000, 700);  

  //fondo=loadImage("fondo.jpg");
  fondo=loadImage("media/fondo3.png");
  paraguasimagen=loadImage("media/paraguas.png");
  //menu = loadImage("media/menu.png");
  //instruc = loadImage ("media/instrucciones.png");
  ganar = loadImage("media/ganaste.png");
  perder = loadImage ("media/perdiste.png");
  // contPaciencia = loadImage ("media/paciencia_1.png");
  //contTiempo = loadImage ("media/timer.png");
  //  contTiempoAutito = loadImage ("media/timer_autito.png");
  // botonJugar = loadImage ("media/botonJugar.png");
  // botonCred = loadImage ("media/botonCreditos.png");

  XFondo = -200;

  famosogifderecha = new Gif(this, "media/famosoderecha.gif");
  famosogifderecha.play();

  famosogifizquierda = new Gif(this, "media/famosoizquierda.gif");
  famosogifizquierda.play();

  //famosoespera = new Gif(this, "media/famosoespera.gif");
  //famosoespera.play();

  smooth();
  //libreria
  Fisica.init(this);
  //mundo 
  world = new FWorld();
  world.setGravity(0, 100);
  world.setEdges( 255);

  posX = width/3;
  posY = height-150;
  desX = int(random(100, 900));

  jugando = true;
  ganaste = false;
  perdiste = false;
  famosoinicial=true;

  // -----------------------CREO EL PARAGUAS -------------------------
  paraguas = new FCircle(250);
  paraguas.setPosition(width/2, height/2);
  paraguas.setStatic(true);
  //paraguas.attachImage(paraguasimagen);
  paraguas.setNoFill();
  paraguas.setNoStroke();
  paraguas.setRestitution(0);
  paraguas.setName("paraguas");
  world.add(paraguas);

  // -------------------------CREO EL PISO ---------------------------
  obstacle = new FBox(width, 2);
  obstacle.setPosition(width/2, height-5);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  obstacle.setName("piso");
  world.add(obstacle);

  //-------------------------CREO EL FAMOSO---------------------------
  famoso = new FBox (100, 200);
  famoso.setFill(143, 23, 51, 0);
  famoso.setNoStroke();
  famoso.setStatic(true);
  famoso.setName("famoso");
  world.add(famoso);
}

void draw() {

  if (jugando == true) {
    image(fondo, XFondo, 0);

    if (famosoinicial == true) {      
      image(famosogifderecha, posX-50, posY-120);
    }

    //if ((XFondo > -400) && (XFondo < 0)) {
    //  if (posX > width/2) {
    //    XFondo --;
    //  }
    //  if (posX < width/2) {

    //    XFondo ++;
    //  }
    //}

    image(paraguasimagen, mouseX-125, mouseY-144, 247, 310);

    famoso.setPosition(posX, posY);
    paraguas.setPosition(mouseX, mouseY);
    //parag.setPosition(mouseX, mouseY);
    veloci = int(random(1, 7));

    desap = int(random (5)); 
    println(desX);

    if (frameCount%60==0) {
      tiempojuego ++;
    }
    println(tiempojuego);
    //println(posX);

    pepit2++;
    //println(pepit2);

    if (pepit2 > 40) {  // espero un toque a que arranque
      if (posX >= desX) {  //si la pos en X es mas grande que el destino, camina hacia atrás
        famosoinicial=false;
        posX = posX-veloci;  //camina hacia atrás
        image(famosogifizquierda, posX-50, posY-120); //gif de caminar hacia atrás
        if ((XFondo > -400) && (XFondo < 0)) {
          if (posX < width/2) {  //si la pos en X es más chica que algo Y está caminando hacia atrás, el fondo retrocede
            XFondo ++;
          }
        }
      } else if (posX <= desX) {  //si la pos en X es mas chica que el destino, camina hacia adelante
        famosoinicial=false;
        posX = posX+veloci;  //camina hacia adelante
        image(famosogifderecha, posX-50, posY-120);  //gif de caminar hacia adelante
        if ((XFondo > -400) && (XFondo < 0)) {
          if (posX > width/2) {  //si la pos en X es más grande que algo Y está caminando hacia adelante, el fondo avanza
            XFondo --;
          }
        }
      }
      if ((posX == desX+3) || (posX == desX-3)) { //si la pos en X es igual o cerca del destino, cambia el destino a uno random
        desX = int(random(100, 900));
        //println("llegó");
      }
    }



    //-----------------caen las gotas de lluvia------------------------------
    if (frameCount % 2 == 0) {
      int altoGota = int(random(7, 20));
      int anchoGota = 5;
      FBox lluvia = new FBox(anchoGota, altoGota);
      lluvia.setPosition(random(0+30, width-30), 10);
      lluvia.setVelocity(0, 300);
      lluvia.setRestitution(0);
      lluvia.setDamping(0);
      lluvia.setNoStroke();
      lluvia.setFill(112, 121, 194);
      lluvia.setGroupIndex(-1);
      lluvia.setName( "lluvia" );
      world.add(lluvia);
    }

    world.draw();
    world.step();

    // -----------------------------pregunto si la lluvia tiene contactos--------------------
    if (lluvia != null) {
      ArrayList contacts = lluvia.getContacts();
      for (int i=0; i<contacts.size(); i++) {
        FContact c = (FContact)contacts.get(i);
      }
    }

    if (enoja == true) {
      tiempoenojado ++;
      //famoso.setFill(194, 12, 38);
      if (frameCount%15==0) {
        paciencia--;
      }
      println (paciencia);
      if (tiempoenojado >= 10) {
        enoja = false;
        //famoso.setFill(143, 23, 51);
        tiempoenojado = 0;
      }
    }

    if (paciencia == 0) {
      jugando = false;
      ganaste = false;
      perdiste = true;
    }

    if (tiempojuego == 15) {
      jugando = false;
      perdiste = false;
      ganaste = true;
    }
  }


  if ((ganaste == true)&&(jugando ==false)) {
    //background (random(255), random(255), random(255));
    //String s= "ganaste loco viva bokita";
    ////String s2 = "apretá 'R' para volver a jugar";
    //textSize(120);
    //fill(255);
    //text (s, 100, 100, 750, 550);
    //textSize (24);
    //text("hacé click para volver a jugar", 100, 500, 500, 50);
    image(ganar, 0, 0);
  }
  if ((perdiste == true)&&(jugando ==false)) {
    //background (0);
    //textSize(24);
    //fill(255);
    //text("perdiste :)", width/4, height/2);
    //text("hacé click para volver a jugar", width/4, 500, 500, 50);
    image(perder, 0, 0);
  }
}

void mouseClicked() {
  if ((ganaste) || (perdiste)) {
    if ((mouseX > 550) && (mouseY > 550)) {
      posX = width/3;
      posY = height-150;
      desX = int(random(100, 900));
      pepit2 = 0;
      paciencia = 10;
      tiempojuego = 0;

      jugando = true;
      ganaste = false;
      perdiste = false;
      famosoinicial = true;

      if (famosoinicial == true) {      
        image(famosogifderecha, posX-50, posY-120);
      }
    }
  }
}

void contactStarted(FContact c) {
  FBody ball1 = null;
  FBody ball2 = null;
  FBody ball3 = null;

  if ( c.contains("piso")) { //pregunto si la lluvia toca el piso (desaparece)
    if (c.getBody1() == obstacle) {
      ball1 = c.getBody2();
    } else if (c.getBody2() == obstacle) {
      ball1 = c.getBody1();
    }
    world.remove(ball1);
    //println("toco piso");
  }

  if (c.contains("paraguas")) { //pregunto si la lluvia toca paraguas (rebota y desaparece)
    if (c.getBody1() == paraguas) {
      ball2 = c.getBody2();
    } else if (c.getBody2() == paraguas) {
      ball2 = c.getBody1();
    }
    ball2.setFill(164, 192, 224);
    ball2.setVelocity(0, 500); //BUSCAR COMO HACER QUE REBOTEN MENOS 
    //println("toco paraguas");
    if (desap == 0) { //desap es un random de 0 a 4. solo cuando es 0 la lluvia desaparece, sino rebota (para que no se borren todas pero tampoco se acumulen)
      world.remove(ball2);
    }
  }

  if (c.contains("famoso")) { //pregunto si la lluvia toca el famoso (desaparece y famoso enoja)
    if (c.getBody1() == famoso) {
      ball3 = c.getBody2();
    } else if (c.getBody2() == famoso) {
      ball3 = c.getBody1();
    }
    world.remove(ball3);
    enoja = true;
    //println("toco famoso");
  }

  if ((ball1 == null) && (ball2 == null) && (ball3 == null)) {
    return;
  }
}
