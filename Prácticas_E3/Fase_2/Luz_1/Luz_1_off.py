import RPi.GPIO as GPIO
# Importamos time, para que la luz se encienda y se apague.
import time

# Para evitar que salga advertencias warning
'''
Que lo que hace es liberar todos los pines que
hayas usado y poner a False su estado eléctrico.
'''
GPIO.setwarnings(False)

# Especificamos los pines que usaremos
ledpin = 11
# Usamos GPIO y el GPIO.BOARD, especifica la enumeración física
GPIO.setmode(GPIO.BOARD)
'''
La opción GPIO.BOARD especifica que se refiere a los pines por el número del pin
del enchufe, es decir, los números impresos en la placa (por ejemplo, P1) y en el
centro de los diagramas a continuación.

La opción GPIO.BCM significa que se está refiriendo a los pines por el número
del "canal Broadcom SOC", estos son los números después de "GPIO".
'''
# Especificamos si el pin será de entrada o salida.
GPIO.setup(ledpin, GPIO.OUT)
# Al colocarlo como HIGH, suministra una alimentación de 3.3V
GPIO.output(ledpin, GPIO.HIGH)

# Hacemos un cliclo while para que parpadee
#while True:
    #break
    '''
    #Hacemos que el led empiece encendido
    GPIO.output(ledpin, GPIO.LOW)
    #Para que se encienda y apague, valor en segundos para pasar a la
    #siguiente instrucción.
    time.sleep(1)
    GPIO.output(ledpin, GPIO.LOW)
    time.sleep(1)
    '''
GPIO.cleanup()
