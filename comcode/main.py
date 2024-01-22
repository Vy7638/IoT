import sys
from Adafruit_IO import MQTTClient
import time
import random

AIO_FEED_ID = ["led", "temperature", "light", "humidity"]
AIO_USERNAME = "Vy2908"
AIO_KEY = ""

def connected(client):
    print("Ket noi thanh cong ...")
    for topic in AIO_FEED_ID:
        client.subscribe(topic)

def subscribe(client , userdata , mid , granted_qos):
    print("Subscribe thanh cong ...")

def disconnected(client):
    print("Ngat ket noi ...")
    sys.exit (1)

def message(client , feed_id , payload):
    print("Nhan du lieu: " + payload)

client = MQTTClient(AIO_USERNAME , AIO_KEY)
client.on_connect = connected
client.on_disconnect = disconnected
client.on_message = message
client.on_subscribe = subscribe
client.connect()
client.loop_background()
counter = 10
led = 0;
while True:
    counter = counter - 1
    if counter <= 0 :  
        counter = 10
        temp = random.randint(20, 50)
        client.publish("temperature", temp)
        light = random.randint(0, 5000)
        client.publish("light", light)
        humi = random.randint(0, 100)
        client.publish("humidity", humi)
        led1 = random.randint(0,1)
        if led1 != led :
            led = led1;
            client.publish("led", led)
    time.sleep(1)        

    