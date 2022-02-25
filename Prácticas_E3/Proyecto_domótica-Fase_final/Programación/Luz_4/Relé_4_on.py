import RPi.GPIO as GPIO
#import time
#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)
#Controlando relay 16
GPIO.setup(16, GPIO.OUT)


#try:
while True:
    boton = int(input("Instrucción: "))
    if boton==0:
        GPIO.output(16, GPIO.HIGH)
        break



GPIO.cleanup();
