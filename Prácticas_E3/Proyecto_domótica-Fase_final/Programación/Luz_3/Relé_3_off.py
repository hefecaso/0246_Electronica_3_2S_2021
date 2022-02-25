import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)

#Controlando relay 15
GPIO.setup(15, GPIO.OUT)

while False:
    boton = int(input("Instrucción: "))
    if boton==1:
        GPIO.output(15, GPIO.LOW)
        break

GPIO.cleanup()
