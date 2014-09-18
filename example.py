import v4l2
import logging
import cv2
from time import time
logging.basicConfig(level=logging.DEBUG)




cap = v4l2.Capture("/dev/video0")
# cap.transport_formats
print cap.frame_rate 
print cap.frame_size 
print cap.transport_format 


cap.frame_sizes
cap.transport_format = 'MJPG'
cap.frame_size = (1920, 1080)
cap.frame_rate=(1,30)
print cap.frame_size
cap = None