import v4l2
import logging
import cv2
from time import time
logging.basicConfig(level=logging.DEBUG)
from time import time,sleep



cap = v4l2.Capture("/dev/video0")
# cap.transport_formats
print cap.frame_rate 
print cap.frame_size 
print cap.transport_format,cap.transport_formats


cap.transport_format = 'MJPG'
print cap.transport_format
cap.frame_size = (1280, 720)
cap.frame_rate=(1,30)
print cap.transport_format,cap.frame_size,cap.frame_rate
for x in range(300):
	cap.get_frame()
cap.close()
cap = None