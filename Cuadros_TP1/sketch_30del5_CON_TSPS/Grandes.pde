class grandes {
  float x, y;
  float tamAncho;
  float tamAltura;
  float rotacion;
  color relleno;
  float borde;
  float angulorandom;
  float varangulos;
  int cuantasHago;


  grandes(color relleno_, float angulorandom_, float cuantasHago_) {
    relleno = relleno_;
    angulorandom = angulorandom_; 
    varangulos = random(3);
    cuantasHago = int(cuantasHago_); 


    //--------------------TAM Y POS----------------------------------------
    if (cuantasHago == 0) { // se hace 1 sola forma grandota e.e
      tamAltura = random(250, 350);
      tamAncho = random(400, 500);
      if (angulorandom == 0) { // <-------------angulo 1
        rotacion = radians(45 + varangulos);
        x = random(250, width-tamAncho);
        y = random(15, 100);
      } else if (angulorandom == 1) { // <-------------angulo 2
        rotacion = radians(100 + varangulos);
        x = random(450, width-tamAncho);
        y = random(115, 200);
      } else if (angulorandom == 2) { // <-------------angulo 3
        rotacion = radians(170 + varangulos);
        x = random(570, width-tamAncho);
        y = random(350, 500);
      }
    } else if (cuantasHago == 1) { // hace 2 formas estiradas
      tamAltura = random(400, 550);
      tamAncho = random (100, 200);
      if (angulorandom == 0) { // <-------------angulo 1
        rotacion = radians(45 + varangulos);
        x = random(400, width-tamAncho);
        y = random(20, 200);
      } else if (angulorandom == 1) { // <-------------angulo 2
        rotacion = radians(100 + varangulos);
        x = random(600, width-tamAncho);
        y = random(200, 400);
      } else if (angulorandom == 2) { // <-------------angulo 3
        rotacion = radians(170 + varangulos);
        x = random(420, width-tamAncho);
        y = random(500, 600);
      }
    } else { // <-------------- hace 3 formas cuadradosas
      tamAltura = random (200, 300);
      tamAncho = random (150, 200);
      if (angulorandom == 0) { // <-------------angulo 1
        rotacion = radians(45 + varangulos);
        x = random(200, width-tamAncho);
        y = random(20, 300);
      } else if (angulorandom == 1) { // <-------------angulo 2
        rotacion = radians(100 + varangulos);
        x = random(450, 650);
        y = random(120, 400);
      } else if (angulorandom == 2) { // <-------------angulo 3
        rotacion = radians(170 + varangulos);
        x = random(300, 600);
        y = random(300, 600);
      }
    }
  }


  void dibujaGrandes() {

    //fill( relleno );
    translate(x, y);
    rotate( rotacion );
    rect(0, 0, tamAncho, tamAltura);
  }
}
