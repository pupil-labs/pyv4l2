import v4l2
import logging
import cv2
from time import time
logging.basicConfig(level=logging.DEBUG)




# xi.handle_xi_error(1)

cap = v4l2.Capture("/dev/video0")

cap = None