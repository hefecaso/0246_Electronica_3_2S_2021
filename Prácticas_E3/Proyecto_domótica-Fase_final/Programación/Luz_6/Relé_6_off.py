import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)

#Controlando relay 18
GPIO.setup(22, GPIO.OUT)

while False:
    boton = int(input("Instrucción: "))
    if boton==1:
        GPIO.output(22, GPIO.LOW)
        break

GPIO.cleanup()
