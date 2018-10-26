# import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish
import paho.mqtt.client as mqtt
import json
import serial
import time
import random
import numpy

HOST= "120.79.63.76"
PORT= 1883

SID= "/ssh/ip"

# 打开串口
# ser = serial.Serial("/dev/ttyUSB0", 115200)


def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe(SID)

def on_message(client, userdata, msg):
    print(msg.topic+" "+msg.payload.decode("utf-8"))

def pypub():  
    while True:
        config1=input("input config1:")
        waterGage=config1#random.uniform(0.5,1)
        config2=input("input config2:")
        voltage=config2#random.uniform(3,5)
        dummy={"waterGage":waterGage,"voltage":voltage}
        jsondata=json.dumps(dummy)
        print(jsondata)
        client_id = time.strftime('%Y%m%d%H%M%S',time.localtime(time.time()))
        publish.single(SID, jsondata, qos = 1,hostname=HOST,port=PORT, client_id=client_id,auth = {'username':"admin", 'password':"public"})
       # print("qitas send")
       # time.sleep(30)

if __name__ == '__main__':
    # client.publish("test", "你好 MQTT", qos=0, retain=False)  # 发布消息    
    pypub()

