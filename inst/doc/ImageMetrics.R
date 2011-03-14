###################################################
### chunk number 1: initdata
###################################################
#line 36 "/Users/user01/Documents/workspace/Stat290/ImageMetrics.Rnw"
	library(ImageMetrics)
	image = new("imageMatrix", X = readPNG(system.file("extdata", "jm-sep25-promise1.png", package="ImageMetrics")), type = "rgba")
	str(image)


###################################################
### chunk number 2: readjpeg
###################################################
#line 46 "/Users/user01/Documents/workspace/Stat290/ImageMetrics.Rnw"
	image = new("imageMatrix", X =  read.jpeg(system.file("data", "Rlogo.jpg", package="ReadImages")), type = "rgba")


###################################################
### chunk number 3: objsel eval=FALSE
###################################################
## #line 81 "/Users/user01/Documents/workspace/Stat290/ImageMetrics.Rnw"
## 	mcattackad = new("imageMatrix", X = readPNG(system.file("extdata", "jm-sep25-promise1.png", package="ImageMetrics")), type = "rgba")
## 	setObjPoly(mcattackad) ## opens tcltk interface
## 	mcattackadpoly = getObjPoly(mcattackad) ## returns polygon corresponding to the object the user selected.
## 	
## 	# create new image with only the object selected.
## 	mcattackadface = new("imageMatrix", X = ObjSelect( image = mcattackad@X, poly= mcattackadpoly ), type = "rgb")
## 	plot(mcattackadface)
## 	writePNG(mcattackadface@X, "obamaface.png")


###################################################
### chunk number 4: hsvmetrics
###################################################
#line 106 "/Users/user01/Documents/workspace/Stat290/ImageMetrics.Rnw"
	data(Campaign2008)
	clinton = new("imageMatrix", X = readPNG(system.file("extdata", "Clinton.png", package="ImageMetrics")), type = "rgba")
	clintonface = new("imageMatrix", X = ObjSelect( image = clinton@X, poly= clintonpoly ), type = "rgb")
	plot(clintonface)
	
	msnbc = new("imageMatrix", X = readPNG(system.file("extdata", "MSNBC.png", package="ImageMetrics")), type = "rgba")
	msnbcface = new("imageMatrix", X = ObjSelect( image = msnbc@X, poly= msnbcpoly ), type = "rgb")
	plot(msnbcface)
	
	clinthsv = meanhsv(clintonface)
	msnbchsv = meanhsv(msnbcface)
	
	msnbchsv$V
	clinthsv$V
	# Clinton ad darker

	msnbchsv$S
	clinthsv$S
	# and less saturated with color


###################################################
### chunk number 5: batchproc eval=FALSE
###################################################
## #line 130 "/Users/user01/Documents/workspace/Stat290/ImageMetrics.Rnw"
## 	data(Campaign2008)
## 	
## 	# Replace the following line with any system directory containing images 
## 	imagedir = system.file("extdata", package="ImageMetrics")
## 	imagedir
## 	
## 	# NOTE: files cannot have "-" characters in them!
## 	for(i in 1:length(filenames)){
## 		file.rename(from = paste( imagedir, "/", filenames[i], sep=""), to = paste( imagedir, "/", 
## 				gsub( pattern = "\\-", replacement = "", filenames[i]), sep=""))
## 	}
## 
## 	# update filenames in directory 
## 	filenames = dir(imagedir)
## 	filenames
## 	
## 	# create an imageMatrix object for every file in the directory
## 	for(img in filenames){
## 		eval(parse(text=paste(img, 
## 				" = new(\"imageMatrix\", X =  readPNG(paste( imagedir, \"/\", img, sep=\"\")), type = \"rgba\")") ))
## 	}
## 	
## 	# Hand-select the polygon for each image:
## 	i = 1
## 	# opens tcltk interface
## 	setObjPoly( eval(parse(text=filenames[i])) ) 
## 	# returns polygon corresponding to the object the user selected.
## 	eval( parse( text = paste(filenames[i], 
## 							"poly = getObjPoly(eval(parse(text=filenames[i])))", 
## 							sep=".")))  
## 	
## 	# Repeat, increasing the index i for each photo...
## 	
## 	# When done with every file, create data object:
## 	objectlist = list()
## 	for(i in 1:length(filenames)){
## 		# store polygon in list
## 		eval(parse(text=paste("objectlist$", filenames[i], "$poly=", filenames[i], ".poly", sep=""))) 
## 		
## 		# store hsv in list:
## 		eval(parse(text=paste("objectlist$", filenames[i], 
## 								"= meanhsv( new(\"imageMatrix\", X = ObjSelect( image = ", 
## 								filenames[i], "@X, poly=", filenames[i], ".poly ), type = \"rgb\"))",
## 								sep="") ))
## 	}
## 	


###################################################
### chunk number 6: svhist
###################################################
#line 184 "/Users/user01/Documents/workspace/Stat290/ImageMetrics.Rnw"
	par(mfrow = c(1,2), cex = .7)
	svhist(msnbcface, main = "MSNBC")
	svhist(clintonface, main = "Clinton" )


