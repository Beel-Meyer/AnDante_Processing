class lineas {
  float x, y;
  float tamAncho;
  float tamAltura;
  float rotacion;
  color relleno;
  float borde;
  float angulorandom;
  float varangulos;
  int cuantasHago;


  lineas(color relleno_, float angulorandom_, float cuantasHago_) {
    relleno = relleno_;
    angulorandom = angulorandom_;
    varangulos = random(3);
    cuantasHago = int(cuantasHago_);

    //-------------------TAM, POS y ANG ---------------------------

    if (cuantasHago == 0) { // si hace una sola forma grande
      tamAltura=random(3, 9);
      tamAncho=random(100, 500);
      if (angulorandom == 0) { // opcion angulo 1
        rotacion = radians(45 + varangulos);
        x=random(20, width/2);
        y=random(20, height/4);
      } else if (angulorandom == 1) { // opcion angulo 2
        rotacion = radians(100 + varangulos);
        x=random(150, 550);
        y=random(10, height/4);
      } else if (angulorandom == 2) { // opcion angulo 3
        rotacion = radians(80 + varangulos);
        x=random(200, 550);
        y=random(70, height/4);
      }
    } else if (cuantasHago == 1) { // si hace 2 formas estiradas
      tamAltura=random(3, 9);
      tamAncho=random(50, 400);
      if (angulorandom == 0) { // <------ angulo 1
        rotacion = radians(225 + varangulos);
        x=random(250, 500);
        y=random(height/2, 550);
      } else if (angulorandom == 1) { //<------ angulo 2
        rotacion = radians(280 + varangulos);
        x=random(100, 450);
        y=random(height/2, 550);
      } else if (angulorandom == 2) { // <------ angulo 3
        rotacion = radians(350 + varangulos);
        x=random(100, width/3);
        y=random(height/2, 550);
      }
    } else { // <------------------ si hace 3 formas mas cuadradas
      tamAltura=random(5, 15);
      tamAncho=random(120, 300);
      if (angulorandom == 0) { // <------ angulo 1
        rotacion = radians(135 + varangulos);
        x=random(230, 450);
        y=random(200, 500);
      } else if (angulorandom == 1) { // <------ angulo 2
        rotacion = radians(100 + varangulos);
        x=random(100, 400);
        y=random(200, 400);
      } else if (angulorandom == 2) { // <------ angulo 3
        rotacion = radians(260 + varangulos);
        x=random(150, 400);
        y=random(height/2, 650);
      }
    }
  }


  void dibujaLineas() {
    fill( relleno );
    translate (x, y);
    rotate( rotacion );
    rect(0, 0, tamAncho, tamAltura);
  }
}
