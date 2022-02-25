/**************************************************
*   Laboratorio de electrónica 3 - 2S_2021        *
*   Sensor de temperatura arduino + fpga          *
*   Integrantes:                                  *
*     Nicole Alejandra López Calderón , 201800683 *
*     Daniel Estuardo Blanco Girón, 201632135     *
*     Héctor Fernando Carrera Soto, 201700923     *
***************************************************/


/*********************
* Llamando dibrerías *
*********************/


#include <Adafruit_MLX90614.h>
#include "SevSeg.h"
// Documentación de la librería: https://github.com/DeanIsMe/SevSeg/blob/master/README.md

/**********************
* Creando instancias  *
**********************/

SevSeg sevseg; // Crear una instancia de un objeto controlador de siete segmentos
Adafruit_MLX90614 mlx = Adafruit_MLX90614(); // Crear una instancia de un objeto MLX90614

/********************
* Definiendo pines  *
********************/

int led_rojo = 10;
int led_verde = 11;
int buzz = 12;
float temperatura;

/************************************
* Creando configuraciónes de pines  *
************************************/

void setup() {

  pinMode(led_rojo, OUTPUT);
  pinMode(led_verde, OUTPUT);
  pinMode(buzz, OUTPUT);

  /*************************************
  * Configurando sensor de temperatura *
  *************************************/

  Serial.begin(9600);
  
  /*
   * Esta instrucción le indica al Arduino que inicie comunicación con la computadora 
   * (o cualquier dispositivo conectado a los pines RX y TX) con una velocidad de comunicación serial de 
   * 9600 bits por segundo (baudios).
   */
   
  while (!Serial);
  
  Serial.println("Adafruit MLX90614 test"); // Revisamos la correcta comunicación entre el sensor y el arduino

  if (!mlx.begin()) {
    Serial.println("Error al conectar con el sensor MLX. Revise el cableado.");
    while (1);
  };

  Serial.print("Emissivity = "); Serial.println(mlx.readEmissivity());
  Serial.println("================================================");

  /************************
  * Configurando displays *
  *************************/

  byte numDigits = 3; // Número de displays
  byte digitPins[] = {A3, A2, A1}; // En donde van conectados los comm
  byte segmentPins[] = {2, 3, 4, 5, 6, 7, 8, 9}; // Pindes de la A ...F y el punto
  bool resistorsOnSegments = true; // 'false' quiere decir que las resistencias están en los pines comm
  byte hardwareConfig = COMMON_ANODE; // See README.md for options
  bool updateWithDelays = false; // Se recomienda el valor predeterminado 'false'
  bool leadingZeros = false; // Usar 'true' si quiero que se muestren los ceros
  bool disableDecPoint = false; // Usar 'true' si el punto decimal no existe en nuestra lecturas o si está desconectado

  sevseg.begin(hardwareConfig, numDigits, digitPins, segmentPins, resistorsOnSegments,
  updateWithDelays, leadingZeros, disableDecPoint);

  // El brillo se puede ajustar usando un valor entre -200 y 200. 0 a 100 es el rango estándar.
  sevseg.setBrightness(90);
}

/******************
* Iniciando loop  *
*******************/

void loop() {
  temperatura = mlx.readObjectTempC(); //Sustituyendo por la variable temperatura

  if(temperatura > 38){
    accion(1,0,1);
  }
  else if (temperatura < 36) {
    accion(1,0,1);
  }
  else{
    accion(0,1,0);
  }

  Serial.print(temperatura); Serial.println("*C");
  sevseg.setNumber(temperatura*10, 1); // el segmentos muestra la T°/10, lo multiplicamos
  delay(10); // 10 ms
  sevseg.refreshDisplay(); // Debe ejecutarse repetidamente


}

/************
* Acciones, creando función *
************/

void accion( int estado_rojo,  int estado_verde,  int estado_buzz){
  digitalWrite(led_rojo, estado_rojo);
  digitalWrite(led_verde, estado_verde);
  digitalWrite(buzz, estado_buzz);
}

/// END ///
