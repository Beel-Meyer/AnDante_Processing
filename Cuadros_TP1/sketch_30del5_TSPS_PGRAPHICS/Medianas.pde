
class medianas {
  float x, y;
  float tamAltura, tamAncho;
  float rotacion;
  color relleno;
  float angulorandom;
  float varangulos;
  int cuantasHago;

  float tamVarx, tamVary; //tamaños de la variación (1 o 2 figuras distintas)
  float posVarx, posVary; //posicion de la variación
  float rotVar; //rotación de la variación

  medianas (color relleno_, float angulorandom_, float cuantasHago_) {
    relleno = relleno_;
    angulorandom = angulorandom_;
    varangulos = random(3);
    cuantasHago = int(cuantasHago_);


    //-------------------TAM, POS y ANG ---------------------------

    if (cuantasHago == 0) { //si hace una sola forma grande
      tamAltura=random(50, 100);
      tamAncho = random (30, 100);
      if (angulorandom == 0) { //opcion angulo 1
        rotacion = radians(45 + varangulos);
        x=random(100, 600);
        y=random(200, 500);
        posVarx = random(100, width/2);
        posVary = random(200, 650);
        rotVar = rotacion + varangulos;
      } else if (angulorandom == 1) { //opcion agnulo 2
        rotacion = radians(10 + varangulos);
        x=random(100, 600);
        y=random(200, 500);
        posVarx = random(100, width-40);
        posVary = random(200, height - 40);
        rotVar = rotacion + varangulos;
      } else if (angulorandom == 2) { //opcion angulo 3
        rotacion = radians(80 + varangulos);
        x=random(100, 580);
        y=random(200, 500);
        posVarx = random(100, width-35);
        posVary = random(200, 650);
        rotVar = rotacion + varangulos;
      }
    } else if (cuantasHago == 1) { //si hace 2 formas estiradas
      tamAltura=random(10, 70);
      tamAncho = random (50, 100);
      if (angulorandom == 0) { // <-----angulo 1
        rotacion = radians(50 + varangulos);
        x=random(tamAncho, width-(tamAncho*2));
        y=random(100, 600);
        posVarx = random(100, 650);
        posVary = random(200, height - 40);
        rotVar = rotacion + varangulos;
      } else if (angulorandom == 1) { //<------angulo 2
        rotacion = radians(15 + varangulos);
        x=random(tamAncho, width-(tamAncho*2));
        y=random(200, 550);
        posVarx = random(100, width-35);
        posVary = random(200, height/2);
        rotVar = rotacion + varangulos;
      } else if (angulorandom == 2) { // <------angulo 3
        rotacion = radians(170 + varangulos);
        x=random(100, width-(tamAncho*2));
        y=random(150, 550);
        posVarx = random(100, width-40);
        posVary = random(200, height-40);
        rotVar = rotacion + varangulos;
      }
    } else { // <----------------- si hace 3 formas más cuadradas
      tamAltura=random(80, 140);
      tamAncho = random (20, 40);
      if (angulorandom == 0) { // <------ angulo 1
        rotacion = radians(135 + varangulos);
        x=random(200, 500);
        y=random(tamAltura, height-tamAltura);
        posVarx = random(200, width - 35);
        posVary = random(100, height - 35);
        rotVar = rotacion + varangulos;
      } else if (angulorandom == 1) { // <------ angulo 2
        rotacion = radians(100 + varangulos);
        x=random(150, width-(tamAncho*2));
        y=random(tamAltura, height-tamAltura);
        posVarx = random(120, width/2);
        posVary = random(100, 650);
        rotVar = rotacion + varangulos;
      } else if (angulorandom == 2) { // <------ angulo 3
        rotacion = radians(260 + varangulos);
        x=random(100, 570);
        y=random(tamAltura, height-tamAltura);
        posVarx = random(100, width - 35);
        posVary = random(100, height - 35);
        rotVar = rotacion + varangulos;
      }
    }

    tamVarx = random(5, 20); //los tamaños de las variaciones no cambian
    tamVary = random(5, 20);
  }

  void dibujaMedianas(PGraphics capa2) { //dibuja la mayoria de las formas
    capa2.noStroke();
    capa2.fill( relleno );
    capa2.translate(x, y);
    capa2.rotate( rotacion );
    capa2.rect(0, 0, tamAncho, tamAltura);
  }
  
}
