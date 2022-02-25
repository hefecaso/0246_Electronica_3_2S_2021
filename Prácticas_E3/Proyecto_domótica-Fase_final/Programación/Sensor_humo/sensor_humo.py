import machine,time
from machine import Pin,PWM
import utime
import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)
GPIO.setmode(GPIO.BOARD)

GPIO.setwarnings(False)
#Controlando relay 18
GPIO.setup(32, GPIO.OUT)
GPIO.setup(29, GPIO.OUT)

MQ2 = machine.ADC(26)
buzzer = PWM(Pin(32))
conversion_factor =3.3/(65535)

while True:
    smoke_value = MQ2.read_u16()
    voltage =MQ2.read_u16()*conversion_factor
    print("Smoke_value is",smoke_value)
    #print("Voltage is",voltage)
    utime.sleep(4)
    if smoke_value<=6000:
        led_green.toggle()
        time.sleep(0.2)
    else:
        led_green.off()
    if smoke_value>=10000:
        buzzer.freq(500)
        buzzer.duty_u16(90000)
        time.sleep(0.9)
        buzzer.duty_u16(0)
        time.sleep(0.7)
        buzzer.duty_u16(1)
        led_red.on()
        time.sleep(0.2)
    else:
        led_red.off()
        buzzer.deinit()

#https://www.youtube.com/watch?v=eeu3KjvaHUU
