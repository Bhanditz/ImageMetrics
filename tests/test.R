# TODO: Add comment
# 
# Author: user01
###############################################################################

library(ImageMetrics)
# read in an image:

image = new("imageMatrix", X = readPNG(system.file("extdata", "jm-sep19-nothingnew1.png", package="ImageMetrics")), type = "rgba")

plot(image)

# User clicks around an object via tcktk device to define a polygon:
setObjPoly(image)
newimage = new("imageMatrix", X = ObjSelect( image = image@X, poly= getObjPoly(image) ), type = "rgb")
plot(newimage)

meanrgb(image)
meanhsv(image)
rgbhist(image)
svhist(image)
huehist(image)
