# TODO: Add comment
# 
# Author: user01
###############################################################################

library(ImageMetrics)
# read in an image:
download.file( "http://www.stanford.edu/~messing/bo/jm-aug6-family2.png", 
		dest = "jm-aug6-family2.png" )

image = new("imageMatrix", X = readPNG("jm-aug6-family2.png"), type = "rgba")
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

#setwd("ImageMetrics/data")
#getwd()
#readings = read.csv("jm-obama-POLY.csv")
#		
#image = new("imageMatrix", X = readPNG("Clinton.png"), type = "rgba")
#plot(image)
#setObjPoly(image)
#clintonpoly = getObjPoly(image)
#clintonface = new("imageMatrix", X = ObjSelect( image = image@X, poly= getObjPoly(image) ), type = "rgb")
#plot(clintonface)
#
#image = new("imageMatrix", X = readPNG("MSNBC.png"), type = "rgba")
#plot(image)
#setObjPoly(image)
#msnbcpoly = getObjPoly(image)
#msnbcface = new("imageMatrix", X = ObjSelect( image = image@X, poly= getObjPoly(image) ), type = "rgb")
#plot(msnbcface)
#
#meanhsv(clintonface)
#meanhsv(msnbcface)
#
#save(readings, clintonpoly, msnbcpoly, file = "Campagin2008.Rda")