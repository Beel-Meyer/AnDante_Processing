class cargarlienzos {
  PImage lienzo1;
PImage lienzo2;
PImage lienzo3;
PImage lienzo4;
float  seleclienzos;
 
  
  
  cargarlienzos(){
  lienzo1= loadImage("lienzo1.jpg");
  lienzo2= loadImage("lienzo2.jpg");
  lienzo3= loadImage("lienzo3.jpg");
  lienzo4= loadImage("lienzo4.jpg");
  seleclienzos=round(random(1.0 ,4.0));
  
  }
  
  void dibujarLienzos(){
  
  
    if( seleclienzos== 1){
  image(lienzo1,0,0,width,height);
  }
  
  else if( seleclienzos== 2){
  image(lienzo2,0,0,width,height);
  }
  
  else if( seleclienzos== 3){
  image(lienzo3,0,0,width,height);
  }
  
  else if( seleclienzos== 4){
  image(lienzo3,0,0,width,height);
  }

  
  
  }
}
