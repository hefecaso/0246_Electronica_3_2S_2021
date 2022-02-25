
from gpiozero import Buzzer
from gpiozero import MotionSensor

import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)

#Controlando relay 18
GPIO.setup(32, GPIO.OUT)
GPIO.setup(22, GPIO.IN)



buzzer_zumbador = Buzzer(32)
pir = MotionSensor(22)
buzzer_zumbador.off()

while True:
    pir.wait_for_motion()
    print("Movimiento detectado")
    buzzer_zumbador.on()
    pir.wait_for_no_motion()
    buzzer_zumbador.off()
    print("Movimiento no detectado")
