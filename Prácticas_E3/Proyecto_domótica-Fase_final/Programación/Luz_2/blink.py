import RPi.GPIO as GPIO
import time
#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)
#Controlando relay 1
GPIO.setup(13, GPIO.OUT)


#try:
while True:
    #boton = int(input("Instrucción: "))
    if True:
        GPIO.output(13, GPIO.LOW)
        print('Hig')
        time.sleep(2)
        GPIO.output(13, GPIO.HIGH)
        print('LOW')
        time.sleep(2)

GPIO.cleanup();
