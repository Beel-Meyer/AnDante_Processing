PImage fondo; 
PImage paraguasimagen; 
PImage menu;
PImage instruc;
PImage ganar;
PImage perder;
PImage creditos;
PImage contPaciencia;
PImage contTiempo;
PImage contTiempoAutito;
PImage botonJugar;
PImage botonCred;
PImage botonJugarAct;
PImage botonCredAct;


int posX, posY, desX; //posicion del famoso
float posXpar, posYpar;
int veloci; //velocidad del famoso
int pepit2; //tiempo hasta que cambia de direccion el famoso 
int desap; //random para que algunas gotas desaparezcan y otras no cuando tocan paraguas
boolean enoja; //si el famoso se enoja o no
int paciencia = 10;
int tiempoenojado; //changüí para que no se enoje tan rápido
int posAuto; //posicion en la que se encuentra el autito que representa el tiempo

int XFondo, YFondo; // posicion en X e Y del fondo

boolean jugando, ganaste, perdiste, famosoinicial, inicio, reglas, credis;
int tiempojuego;
//String izquierda;

import fisica.*;      //importo librería física

import gifAnimation.*;  //importo librería gif
Gif famosogifderecha;
Gif famosogifizquierda;

Gif famosoespera;

import tsps.*;        //importo tsps
TSPS tsps;

import ddf.minim.*;   //importo minim
Minim gestor;
AudioPlayer musicadefondo;
AudioPlayer musicaperdiste;
AudioPlayer musicaganaste;
AudioSample semoja;




FWorld world;
FCircle paraguas;    //paraguas hecho con círculo
FBox obstacle;
FBox famoso;
FBox lluvia;
FPoly parag;        //paraguas hecho con poligonos (actualmente no usado)


void setup() {
  size(1000, 700);  

  //--------------------cargo todas las imágenes------------------------------
  //fondo=loadImage("fondo.jpg");
  fondo=loadImage("media/fondo4.png");
  paraguasimagen=loadImage("media/paraguas.png");
  menu = loadImage("media/menu.png");
  instruc = loadImage ("media/instrucciones2.png");
  ganar = loadImage("media/ganaste2.png");
  perder = loadImage ("media/perdiste2.png");
  contPaciencia = loadImage ("media/paciencia_1.png");
  contTiempo = loadImage ("media/timer.png");
  contTiempoAutito = loadImage ("media/timer_autito.png");
  botonJugar = loadImage ("media/botonJugar.png");
  botonCred = loadImage ("media/botonCreditos.png");
  botonJugarAct = loadImage ("media/botonJugar_ACT.png");
  botonCredAct = loadImage ("media/botonCreditos_ACT.png");
  creditos = loadImage ("media/creditos2.png");

  tsps = new TSPS (this, 12000);    //asigno el tsps

  //XFondo = -200;
  YFondo = -50;


  gestor=new Minim(this);          //asigno minim (?
  musicadefondo=gestor.loadFile("media/musicadefondo.mp3");
  musicaperdiste=gestor.loadFile("media/musicaperdiste.mp3");
  musicaganaste=gestor.loadFile("media/musicaganaste.mp3");
  musicadefondo.setGain(-10);
  musicaperdiste.setGain(-10);

  semoja=gestor.loadSample("media/semoja.mp3");


  famosogifderecha = new Gif(this, "media/famosoderecha.gif");
  famosogifderecha.play();

  famosogifizquierda = new Gif(this, "media/famosoizquierda.gif");
  famosogifizquierda.play();

  famosoespera = new Gif(this, "media/famosoespera.gif");
  famosoespera.play();

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
  posAuto = 540;
  posXpar = width/2-125;
  posYpar = height/2-144;

  inicio = true;
  reglas = false;
  credis = false;
  jugando = false;
  ganaste = false;
  perdiste = false;
  famosoinicial=false;

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

  if (inicio) { // --------------------------- ESTADO DEL MENU --------------------------
    image(menu, 0, 0);
    image(botonJugar, 50, 440);
    image(botonCred, 50, 560);
    if ((mouseX > 50) && (mouseX < 260) && (mouseY > 440) && (mouseY < 535)) {
      image(botonJugarAct, 50, 440);
    }
    if ((mouseX > 50) && (mouseX < 260) && (mouseY > 560) && (mouseY < 655)) {
      image(botonCredAct, 50, 560);
    }
  }

  if (credis) { // --------------------------- ESTADO DE LOS CREDITOS --------------------------
    image (creditos, 0, 0);
  }

  if (reglas) { // --------------------------- ESTADO DE INSTRUCCIONES --------------------------
    image(instruc, 0, 0);
    image (famosoespera, 820, 280);
  }

  if (jugando == true) { // --------------------------- ESTADO DE JUGANDO --------------------------
    musicadefondo.play();
    image(fondo, 0, YFondo);
    musicaperdiste.pause();
    musicaganaste.pause();


    //----------------uso TSPS para captar movimiento --------!---------!-------!---------!---------!-------!
    //TSPSPerson[] personas = tsps.getPeopleArray();
    //int canti = personas.length;
    //TSPSPerson p;

    //for (int i=0; i<canti; i++) {
    //  p = personas[i];

    //  posXpar = (p.boundingRect.x)*700;
    //  posYpar = (p.boundingRect.y)*700;

    //}

    //---------------- uso MOUSE para captar movimiento ----!----------!--------!------!-------!------!
    posXpar = mouseX-125;

    if ((mouseY > 250) && (mouseY < 450)) {
      posYpar = mouseY-124;
    }

    image(contPaciencia, 20, 20);
    image (contTiempo, 580, 20);
    image (contTiempoAutito, posAuto, 20);

    if (famosoinicial == true) {      
      image(famosogifderecha, posX-50, posY-120);
    }

    image(paraguasimagen, posXpar, posYpar, 247, 310);

    famoso.setPosition(posX, posY);
    paraguas.setPosition(posXpar+125, posYpar+150); //----------------------------------------------ACA CALIBRAR PARAGUAS CON TSPS
    veloci = int(random(1, 7));

    desap = int(random (5)); 
    //println(desX);

    if (frameCount%60==0) {
      tiempojuego ++;
      posAuto += 25;
    }
    //println(tiempojuego);
    //println(posX);
    pepit2++;
    //println(pepit2);

    if (pepit2 > 40) {  // espero un toque a que arranque
      if (posX >= desX) {  //si la pos en X es mas grande que el destino, camina hacia atrás
        famosoinicial=false;
        posX = posX-veloci;  //camina hacia atrás
        image(famosogifizquierda, posX-50, posY-120); //gif de caminar hacia atrás
        //if ((XFondo > -400) && (XFondo < 0)) {
        //  if (posX < width/2) {  //si la pos en X es más chica que algo Y está caminando hacia atrás, el fondo retrocede
        //    XFondo ++;
        //  }
        //}
      } else if (posX <= desX) {  //si la pos en X es mas chica que el destino, camina hacia adelante
        famosoinicial=false;
        posX = posX+veloci;  //camina hacia adelante
        image(famosogifderecha, posX-50, posY-120);  //gif de caminar hacia adelante
        //if ((XFondo > -400) && (XFondo < 0)) {
        //  if (posX > width/2) {  //si la pos en X es más grande que algo Y está caminando hacia adelante, el fondo avanza
        //    XFondo --;
        //  }
        //}
      }
      if ((posX == desX+3) || (posX == desX-3)) { //si la pos en X es igual o cerca del destino, cambia el destino a uno random
        desX = int(random(270, 720));
        println(desX);
        //println("llegó");
      }
    }



    //-----------------caen las gotas de lluvia------------------------------
    if (frameCount % 3 == 0) {
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
      if (frameCount%15==0) {
        paciencia--;
        semoja.trigger();
      }
      //println (paciencia);
      if (tiempoenojado >= 10) {
        enoja = false;
        tiempoenojado = 0;
      }
    }

    if (paciencia == 10) {
      contPaciencia = loadImage ("media/paciencia_1.png");
    }
    if (paciencia == 9) {
      contPaciencia = loadImage ("media/paciencia_2.png");
    }
    if (paciencia == 8) {
      contPaciencia = loadImage ("media/paciencia_3.png");
    }
    if (paciencia == 7) {
      contPaciencia = loadImage ("media/paciencia_4.png");
    }
    if (paciencia == 6) {
      contPaciencia = loadImage ("media/paciencia_5.png");
    }
    if (paciencia == 5) {
      contPaciencia = loadImage ("media/paciencia_6.png");
    }
    if (paciencia == 4) {
      contPaciencia = loadImage ("media/paciencia_7.png");
    }
    if (paciencia == 3) {
      contPaciencia = loadImage ("media/paciencia_8.png");
    }
    if (paciencia == 2) {
      contPaciencia = loadImage ("media/paciencia_9.png");
    }
    if (paciencia == 1) {
      contPaciencia = loadImage ("media/paciencia_10.png");
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

  if ((ganaste == true)&&(jugando ==false)) { // --------------------------- ESTADO DE GANASTE --------------------------
    image(ganar, 0, 0);
    musicadefondo.pause();
    musicaganaste.play();
    musicadefondo.pause();
  }
  if ((perdiste == true)&&(jugando ==false)) {  // --------------------------- ESTADO DE PERDISTE --------------------------
    image(perder, 0, 0);
    musicadefondo.pause();


    musicaperdiste.play();
  }
}

void mouseClicked() {

  if (inicio) {
    if ((mouseX > 50) && (mouseX < 260) && (mouseY > 440) && (mouseY < 535)) {
      reglas = true;
      inicio = false;
    }
    if ((mouseX > 50) && (mouseX < 260) && (mouseY > 560) && (mouseY < 655)) {
      credis = true;
      inicio = false;
    }
  }

  if (credis) {
    if ((mouseX > 204) && (mouseX < 364) && (mouseY > 582) && (mouseY < 636)) {
      credis = false;
      inicio = true;
    }
  }

  if (reglas) {
    if ((mouseX > 508) && (mouseX < 778) && (mouseY > 582) && (mouseY < 636)) {
      reglas = false;
      jugando = true;
      famosoinicial = true;
    }
    if ((mouseX > 204) && (mouseX < 364) && (mouseY > 582) && (mouseY < 636)) {
      reglas = false;
      inicio = true;
    }
  }

  if ((ganaste) || (perdiste)) {
    if ((mouseX > 474) && (mouseX < 778) && (mouseY > 582) && (mouseY < 636)) {
      posX = width/3;
      posY = height-150;
      desX = int(random(100, 900));
      posAuto = 540;
      pepit2 = 0;
      paciencia = 10;
      tiempojuego = 0;

      jugando = true;
      ganaste = false;
      perdiste = false;
      famosoinicial = true;
      reglas = false;
      inicio = false;
      credis = false;

      musicadefondo.play();

      if (famosoinicial == true) {      
        image(famosogifderecha, posX-50, posY-120);
      }
    }

    if ((mouseX > 204) && (mouseX < 364) && (mouseY > 582) && (mouseY < 636)) {
      posX = width/3;
      posY = height-150;
      desX = int(random(100, 900));
      posAuto = 540;
      pepit2 = 0;
      paciencia = 10;
      tiempojuego = 0;

      perdiste = false;
      ganaste = false;
      inicio = true;
      famosoinicial = true;
      reglas = false;
      jugando = false;
      credis = false;

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

void keyPressed() {
  println ("tecla");
  if (frameCount % 2 == 0) {
    if (key == CODED) {
      if (keyCode == LEFT) {

        //if (inicio) {
        //  credis = true;
        //  inicio = false;
        //}

        if (credis) {
          inicio = true;
          credis = false;
        }

        if (reglas) {
          inicio = true;
          reglas = false;
        }

        if ((ganaste) || (perdiste)) {
          posX = width/3;
          posY = height-150;
          desX = int(random(100, 900));
          posAuto = 540;
          pepit2 = 0;
          paciencia = 10;
          tiempojuego = 0;

          perdiste = false;
          ganaste = false;
          inicio = true;
          famosoinicial = true;
          reglas = false;
          jugando = false;
          credis = false;

          if (famosoinicial == true) {      
            image(famosogifderecha, posX-50, posY-120);
          }
        }
      }

      if (keyCode == RIGHT) {

        //if (inicio) {
        //  reglas = true;
        //  inicio = false;
        //}

        if (reglas) {
          jugando = true;
          reglas = false;
          famosoinicial = true;
        }

        if ((ganaste)||(perdiste)) {
          posX = width/3;
          posY = height-150;
          desX = int(random(100, 900));
          posAuto = 540;
          pepit2 = 0;
          paciencia = 10;
          tiempojuego = 0;

          jugando = true;
          ganaste = false;
          perdiste = false;
          famosoinicial = true;
          reglas = false;
          inicio = false;
          credis = false;

          musicadefondo.play();

          if (famosoinicial == true) {      
            image(famosogifderecha, posX-50, posY-120);
          }
        }
      }

      if (keyCode == UP) {
        if (inicio) {
          reglas = true;
          inicio = false;
        }
      }

      if (keyCode == DOWN) {
        if (inicio) {
          credis = true;
          inicio = false;
        }
      }
    }
  }
}
