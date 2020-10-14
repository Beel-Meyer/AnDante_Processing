
class medianas {
  float x, y;
  float tamAltura;
  float tamAncho;
  float rotacion;
  color relleno;
  float angulorandom;
  float varangulos;
  int cuantasHago;

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
      } else if (angulorandom == 1) { //opcion agnulo 2
        rotacion = radians(10 + varangulos);
        x=random(100, 600);
        y=random(200, 500);
      } else if (angulorandom == 2) { //opcion angulo 3
        rotacion = radians(80 + varangulos);
        x=random(100, 580);
        y=random(200, 500);
      }
    } else if (cuantasHago == 1) { //si hace 2 formas estiradas
      tamAltura=random(10, 70);
      tamAncho = random (50, 100);
      if (angulorandom == 0) { // <-----angulo 1
        rotacion = radians(50 + varangulos);
        x=random(tamAncho, width-(tamAncho*2));
        y=random(100, 600);
      } else if (angulorandom == 1) { //<------angulo 2
        rotacion = radians(15 + varangulos);
        x=random(tamAncho, width-(tamAncho*2));
        y=random(200, 550);
      } else if (angulorandom == 2) { // <------angulo 3
        rotacion = radians(170 + varangulos);
        x=random(100, width-(tamAncho*2));
        y=random(150, 550);
      }
    } else { // <----------------- si hace 3 formas más cuadradas
      tamAltura=random(80, 140);
      tamAncho = random (20, 40);
      if (angulorandom == 0) { // <------ angulo 1
        rotacion = radians(135 + varangulos);
        x=random(200, 500);
        y=random(tamAltura, height-tamAltura);
      } else if (angulorandom == 1) { // <------ angulo 2
        rotacion = radians(100 + varangulos);
        x=random(150, width-(tamAncho*2));
        y=random(tamAltura, height-tamAltura);
      } else if (angulorandom == 2) { // <------ angulo 3
        rotacion = radians(260 + varangulos);
        x=random(100, 570);
        y=random(tamAltura, height-tamAltura);
      }
    }
  }

  void dibujaMedianas() {
    fill( relleno );
    translate(x, y);
    rotate( rotacion );
    rect(0, 0, tamAncho, tamAltura);
  }
}
