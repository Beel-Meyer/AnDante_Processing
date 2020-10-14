
grandes[]Grandes1=new grandes[3];
lineas[]Lineas1=new lineas[15];
medianas[]Medianas1= new medianas[10];
cargarlienzos Cargarlienzos1;

Dir_y_Vel miVelocidadYDireccion;

float randomLineas;
float randomGrandes;
float randomMedianas;
Paleta paleta;
float angulos;
float veloci;
float pepito; //variable pepito que va a servir para contar cuantas lineas se hacen
float frametop = 250; //valor maximo de frames para las lineas
int frameGrandesTop = 50; //valor maximo de frames para las grandes
int frameGrandes; //contador de frames de formas grandes
float pepitoM; //variable para contar cuantas medianas se hacen
int frameMedias; //contador de frames de formas medianas
int frameMediasTop = 165; //valor maximo de frames para las medianas
float cualGrandes;

import tsps.*; //TE ESE PE ESE
TSPS tsps;

void setup() {
  size(700, 700); 
  Cargarlienzos1= new cargarlienzos();
  Cargarlienzos1.dibujarLienzos();
  miVelocidadYDireccion = new Dir_y_Vel();
  randomLineas = random(8, 15);
  randomGrandes = 3;
  randomMedianas = random (5, 10);
  pepito = int(randomLineas); //pepito igualado a la cantidad maxima de lineas
  pepitoM = int(randomMedianas); //pepitoM igualado a la cantidad maxima de medianas
  paleta = new Paleta( "coloresh.png" );
  noStroke();
  cualGrandes = int(random(3)); //random que define cuantas formas grandes se hacen
  angulos = int(random(3)); //random que determina en qué rango de angulos trabajan las formas

  frameGrandes = 0; //me aseguro que estas dos inicien en 0
  frameMedias = 0;

  tsps = new TSPS(this, 12000); // TSPS


  //----------------- ACA SE INICIALIZAN LOS ARREGLOS DE LAS FORMAS-----------------------

  for (int ig=0; ig<3; ig++) {
    Grandes1[ig]=new grandes(paleta.darUnColor(), angulos, cualGrandes);
  }


  for (int il=0; il<15; il++) {
    Lineas1[il]=new lineas(paleta.darUnColor(), angulos, cualGrandes);
  }

  for (int im=0; im<10; im++) {
    Medianas1[im]=new medianas(paleta.darUnColor(), angulos, cualGrandes);
  }
}


void draw() {
  println("angulo "+angulos);

  miVelocidadYDireccion.calcularTodo (mouseX, mouseY);

  //veloci = miVelocidadYDireccion.velocidad();

  println("cuantas " + cualGrandes);

  TSPSPerson[] personas = tsps.getPeopleArray();
  int cant = personas.length;
  TSPSPerson p;

  for (int i=0; i<cant; i++) {
    p = personas[i];

    veloci = p.velocity.x;

    if (veloci <= 0) {
      veloci = veloci*-1;
    }
    println(veloci);


    if (frameCount > frametop) {
      frameCount = 0; //si la cantidad de frames supera la que utilizan las lineas, vuelve a 0
    }

    if (frameGrandes > frameGrandesTop) {
      frameGrandes = 0; // si el contador de frames supera las que utilizan las grandes, a 0
    }

    if (frameMedias > frameMediasTop) {
      frameMedias = 0; //es obvio no?
    }
    //--------------------ACA SE DIBUJAN LAS LINNNIIAASSSSSS-----------------------------

    if (veloci > 40) {
      if (frameCount==15) {
        if (pepito > 0) { 
          pushMatrix();
          Lineas1[0].dibujaLineas();
          popMatrix();
          pepito = pepito-1;
        }
      }

      if (frameCount==30) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[1].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==45) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[2].dibujaLineas();
          Lineas1[2].dibujaLinVar();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==60) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[3].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==75) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[4].dibujaLineas();
          Lineas1[4].dibujaLinVar();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==90) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[5].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }


      if (frameCount==105) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[6].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==120) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[7].dibujaLineas();
          Lineas1[7].dibujaLinVar();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==145) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[8].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==160) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[9].dibujaLineas();
          Lineas1[9].dibujaLinVar();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==175) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[10].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==190) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[11].dibujaLineas();
          Lineas1[11].dibujaLinVar();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==205) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[12].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==220) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[13].dibujaLineas();
          Lineas1[13].dibujaLinVar();
          popMatrix();
          pepito =pepito-1;
        }
      }

      if (frameCount==245) {
        if (pepito > 0) {
          pushMatrix();
          Lineas1[14].dibujaLineas();
          popMatrix();
          pepito =pepito-1;
        }
      }
    }
    //println("pepito "+ pepito); //hay que imprimir para que anden las cosas

    //--------------------------------ACA SE DIBUJAN LAS GRRRRRANDESSSS-------------------------------

    if ((veloci > 0) && (veloci <= 10)) {

      if (cualGrandes == 0) { //si cualgrandes es 0 dibuja 1 sola forma
        if (frameGrandes==15) { //para no repetir el framecount, estas formas tienen su propio contador de frames
          pushMatrix();
          fill(22, 22, 22);
          Grandes1[0].dibujaGrandes();
          popMatrix();
        }
      } else if (cualGrandes == 1) { //si cualgrandes es 1 dibuja 2 formas
        if (frameGrandes==15) { 
          pushMatrix();
          fill (183, 12, 12);
          Grandes1[0].dibujaGrandes();
          popMatrix();
        }    
        if (frameGrandes==30) { 
          pushMatrix();
          fill(237, 199, 47);
          Grandes1[1].dibujaGrandes();
          popMatrix();
        }
      } else { //si cualgrandes es 2 dibuja las 3 formas
        if (frameGrandes==15) { 
          pushMatrix();
          fill(183, 12, 12);
          Grandes1[0].dibujaGrandes();
          popMatrix();
        }

        if (frameGrandes==30) {
          pushMatrix();
          fill(237, 199, 47);
          Grandes1[1].dibujaGrandes();
          popMatrix();
        }

        if (frameGrandes==45) {
          pushMatrix();
          fill (2, 39, 140);
          Grandes1[2].dibujaGrandes();
          popMatrix();
        }
      }
    }

    //----------------------------------Y ACA LAS MEDIANAS :) -------------------------------------------------


    if ((veloci > 15) && (veloci <=35)) {
      if (frameMedias==15) { 
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[0].dibujaMedianas();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==30) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[1].dibujaMedianas();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==45) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[2].dibujaMedianas();
          Medianas1[2].dibujaMedVar();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==60) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[3].dibujaMedianas();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==75) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[4].dibujaMedianas();
          Medianas1[4].dibujaMedVar();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==90) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[5].dibujaMedianas();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==105) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[6].dibujaMedianas();
          Medianas1[6].dibujaMedVar();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==120) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[7].dibujaMedianas();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==145) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[8].dibujaMedianas();
          Medianas1[8].dibujaMedVar();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
      if (frameMedias==160) {
        if (pepitoM > 0) {
          pushMatrix();
          Medianas1[9].dibujaMedianas();
          popMatrix();
          pepitoM = pepitoM-1;
        }
      }
    }

    //para simular un framecount, a estas dos variables se les suma 1 cada vez que el draw se recorre a si mismo
    //o sea, 60 veces por segundo, igual que el framecount ;)
    frameMedias ++; 
    frameGrandes ++;


    //deja de dibujar si pasan 40 segundos
    //if (millis() > 40000) {
    //  noLoop();
    //}
  }
}
