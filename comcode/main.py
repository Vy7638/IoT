import sys
from Adafruit_IO import MQTTClient
import time
import random
# from simple_ai import image_detector
from uart import *

AIO_FEED_ID = ["led", "machine", "temperature", "light", "humidity", "status-ai"]
AIO_USERNAME = "Vy2908"
AIO_KEY = "aio_hPMF75Jf5Hg5AAB485jSgMegaowp"

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
    if  feed_id == "led":
        if payload == "0":
            writeData("1")
        else:
            writeData("2")
    if feed_id == "machine":
        if payload == "0":
            writeData("3")
        else:
            writeData("4")


client = MQTTClient(AIO_USERNAME , AIO_KEY)
client.on_connect = connected
client.on_disconnect = disconnected
client.on_message = message
client.on_subscribe = subscribe
client.connect()
client.loop_background()

counter = 0
# led = 0
res_ai = ""

while True:
    counter = counter - 1

    # if counter <= 0:
    #     counter = 10
    #     temp = random.randint(20, 50)
    #     client.publish("temperature", temp)
    #     light = random.randint(0, 5000)
    #     client.publish("light", light)
    #     humi = random.randint(0, 100)
    #     client.publish("humidity", humi)
    #     led1 = random.randint(0,1)
    #     if led1 != led :
    #         led = led1;
    #         client.publish("led", led)
    
    # if counter <= 0 :  
    #     counter = 10
    #     #---simple ai image detector-----
    #     res_ai_prev = res_ai
    #     res_ai = image_detector()
    #     print("Output AI: ", res_ai)
    #     if res_ai_prev != res_ai:
    #         client.publish("status-ai", res_ai)

    #-----read data-------
    # readSerial(client)

    time.sleep(1)        

    