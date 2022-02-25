import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)

#Controlando relay 16
GPIO.setup(16, GPIO.OUT)

while False:
    boton = int(input("Instrucción: "))
    if boton==1:
        GPIO.output(16, GPIO.LOW)
        break

GPIO.cleanup()
