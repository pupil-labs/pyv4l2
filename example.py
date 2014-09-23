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

cap.frame_size = (1920, 1080)
cap.frame_rate=(1,30)
print 'Will capture at:',cap.transport_format,cap.frame_size,cap.frame_rate
for x in range(1):
	frame = cap.get_frame()

	# print frame.width,frame.height
	print frame.ds
	# y= frame.bgr
	# print v.shape
	# img = frame.bgr
	# y,u,v = img
	# cv2.imshow("img",img)
	# cv2.imshow("u",u)
	# cv2.imshow("v",v)

	# cv2.waitKey(1)
	# print img
cap.close()
cap = None


