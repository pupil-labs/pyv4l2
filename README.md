pyv4l2
=======

Python bindings for Video4Linux2 API

## example code
```python
import v4l2
cap = v4l2.Capture("/video/dev0")
frame = cap.get_frame()
cap = None
```


##dependecy libjpeg-turbo (and it needd to be build with fpic!)
```


## just build locally
```
python setup.py build_ext -i
```

## or install
```
python setup.py install
```