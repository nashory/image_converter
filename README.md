# image_converter
Multi-threaded image converter for easy image preprocessing for torch.


## Prerequisites
+ python2.7
+ Torch7



## Functionality
__1.Change file format__
    + png, jpg

__2. Filter invalid image__

__3. Extract desired number of images from the source__

__4. Resize and padding__

__5. Multi-threaded loading and saving__

__6. Adjust contrast/brightness__

__7. Save images into .t7 format__


## USAGE
~~~
th imconverter.lua --input <source_dir> --output <target_dir> --format <image_format> --extract <number_of_images> --resize <img_size> --padding <yes/no> --brightness <brightness_range> --save_t7 <yes/no>

(e.g.) th imconverter.lua \
			--input /home/nashory/src
			--output /home/nashory/target
			--format png
			--extract 1000
			--resize 128
			--padding no
			--brightness 0.5
			--save_t7 yes
~~~

## TODO
- [ ] Change file format
- [ ] Filter invalid image
- [ ] extract specific number of images
- [ ] resize and padding
- [ ] Multi-threaded loading and saving
- [ ] Adjust contrast/brightness
- [ ] Save into .t7 format


## Author
MinchulShin, [@nashory](https://github.com/nashory)











