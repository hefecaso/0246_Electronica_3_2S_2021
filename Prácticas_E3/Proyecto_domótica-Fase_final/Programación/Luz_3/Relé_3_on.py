import RPi.GPIO as GPIO
#import time
#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)
#Controlando relay 15
GPIO.setup(15, GPIO.OUT)


#try:
while True:
    boton = int(input("Instrucción: "))
    if boton==0:
        GPIO.output(15, GPIO.HIGH)
        break



GPIO.cleanup();
