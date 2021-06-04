## Homework 6 - June 7

###  Creating a simple work of art using some form of image manipulation and pixels.

#### PIXELART

Below is the screenshot of the different outputs using different images :

&emsp; <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%207/screenshot1.jpg" height="280"> <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%207/screenshot3.jpg" height="280"> <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%207/screenshot4.jpg" height="280"> <img src="https://github.com/ronit-singh/Intro_to_IM/blob/main/June%207/screenshot2.jpg" height="280">

**Description**

This artwork is made by manipulating the normal image by converting it to pixels. In the output, the normal image can be seen in the top-right corner for the purpose of comparing. I used circles (ellipse) to represent each pixel with either red, green or blue colors at random positions. Moreover, I have used opacity as an additional parameter to make the output look blended with the background and not standout or appear too bright on screen. The size of the dots or circles can be changed as desired by modifying the ````dotSize```` variable. This program doesn't include the ````draw()```` function (all code in ````setup()````) because I wanted to have a static output. ````draw()```` function was giving me a flickering output, but I could stop it using ````noLoop()```` function at the end. Hence, I thought not to include it instead. Also, I noticed that my program worked fine even without using ````updatePixels()```` function. However,  when I used it, the code gave me an empty screen. I'm not sure why, so I didn't use it. 




