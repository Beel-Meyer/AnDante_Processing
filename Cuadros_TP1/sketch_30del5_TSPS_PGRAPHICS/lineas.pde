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

  float tamVarx, tamVary; //tamaños de la variación (1 o 2 figuras distintas)
  float posVarx, posVary; //posicion de la variación
  float rotVar; //rotación de la variación

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
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(135 + varangulos);
      } else if (angulorandom == 1) { // opcion angulo 2
        rotacion = radians(100 + varangulos);
        x=random(150, 550);
        y=random(10, height/4);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(10 + varangulos);
      } else if (angulorandom == 2) { // opcion angulo 3
        rotacion = radians(80 + varangulos);
        x=random(200, 550);
        y=random(70, height/4);
        posVarx = random(width/2, width/3);
        posVary = random(height/2, height/3);
        rotVar = radians(30 + varangulos);
      }
    } else if (cuantasHago == 1) { // si hace 2 formas estiradas
      tamAltura=random(3, 9);
      tamAncho=random(50, 400);
      if (angulorandom == 0) { // <------ angulo 1
        rotacion = radians(225 + varangulos);
        x=random(250, 500);
        y=random(height/2, 550);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(135 + varangulos);
      } else if (angulorandom == 1) { //<------ angulo 2
        rotacion = radians(280 + varangulos);
        x=random(100, 450);
        y=random(height/2, 550);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(190 + varangulos);
      } else if (angulorandom == 2) { // <------ angulo 3
        rotacion = radians(350 + varangulos);
        x=random(100, width/3);
        y=random(height/2, 550);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(260 + varangulos);
      }
    } else { // <------------------ si hace 3 formas mas cuadradas
      tamAltura=random(5, 15);
      tamAncho=random(120, 300);
      if (angulorandom == 0) { // <------ angulo 1
        rotacion = radians(135 + varangulos);
        x=random(230, 450);
        y=random(200, 500);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(45 + varangulos);
      } else if (angulorandom == 1) { // <------ angulo 2
        rotacion = radians(100 + varangulos);
        x=random(100, 400);
        y=random(200, 400);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(10 + varangulos);
      } else if (angulorandom == 2) { // <------ angulo 3
        rotacion = radians(260 + varangulos);
        x=random(150, 400);
        y=random(height/2, 650);
        posVarx = random(width/2, width - 35);
        posVary = random(height/2, height - 35);
        rotVar = radians(150 + varangulos);
      }
    }

    tamVarx = random(100, 300); //los tamaños de las variaciones no cambian
    tamVary = random(2, 6);
  }

  void dibujaLineas(PGraphics capa3) {
    capa3.noStroke();
    capa3.fill( relleno );
    capa3.translate (x, y);
    capa3.rotate( rotacion );
    capa3.rect(0, 0, tamAncho, tamAltura);
  }
  
}
