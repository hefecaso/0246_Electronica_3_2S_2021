import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)

#Controlando relay 13
GPIO.setup(13, GPIO.OUT)

while False:
    boton = int(input("Instrucción:"))
    if boton == 1:
        GPIO.output(13, GPIO.LOW)
        break

GPIO.cleanup()
