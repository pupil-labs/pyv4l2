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
for x in range(300):
	frame = cap.get_frame()
	# print frame.width,frame.height
	img = frame.gray
	cv2.imshow("test",img)
	cv2.waitKey(1)
	# print img
cap.close()
cap = None



# if __name__ == '__main__':

#     import cProfile,subprocess,os
#     # cProfile.runctx("test()",{},locals(),"bench.pstats")
#     # loc = os.path.abspath(__file__).rsplit('pupil_src', 1)
#     gprof2dot_loc = 'gprof2dot.py'
#     subprocess.call("python "+gprof2dot_loc+" -f pstats bench.pstats | dot -Tpng -o bench.png", shell=True)
#     print "created cpu time graph for av_writer process. Please check out the png next to the av_writer.py file"
