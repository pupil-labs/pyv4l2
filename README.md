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


##dependecy libjpeg-turbo 
Needs to be build with fpic!
Will be installed to `/opt/libjpeg-turbo`.

```
wget latest source
unzip source_dir
cd source_dir
./configure --with-pic
sudo make install
```

## just build locally
```
python setup.py build_ext -i
```

## or install
```
python setup.py install
```