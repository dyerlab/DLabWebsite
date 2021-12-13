---
title: Raster Plotting
date: 2016-03-18T10:40:06+00:00
guid: http://dyerlab.bio.vcu.edu/?p=857
permalink: /2016/03/18/raster-plotting/

categories:
  - Code
  - R
tags:
  - R
  - raster
---
A raster is essentially an image, whose pixel size correspond to a particular spatial extent and the data contained within each pixel represents a particular feature on the landscape. Common rasters are DEM’s (measuring elevation), rainfall, temperature, buildings, etc. In R, it is common to think of rasters as matrices whose values measure some feature on the landscape. In this section, we will examine how to acquire, load, manipulate, and extract data from raster objects.

<!--more-->

As mentioned above, a raster is essentially a matrix with some additional data added onto it related to the spatial extent of the values it contains. As such, we can easily start with a general matrix, perform various matrix manipulations, and then transform it into a raster object when we need it to have spatial properties and attributes. Here is an example of a basic matrix, whose values have been set to random normal variables (mean=0, sd=1) and then plot using the normal R plotting functions.

<pre class="lang:r decode:true">x <- matrix(rnorm(100),ncol=10)
image(x)
</pre>

<img class="aligncenter wp-image-858 size-large" src="wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.33.30-AM-1024x623.png" alt="Screen Shot 2016-03-18 at 11.33.30 AM" width="768" height="467" srcset="wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.33.30-AM-1024x623.png 1024w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.33.30-AM-300x182.png 300w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.33.30-AM-768x467.png 768w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.33.30-AM-1568x954.png 1568w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.33.30-AM.png 1588w" sizes="(max-width: 768px) 100vw, 768px" /> 

<span style="line-height: 1.5;">You can see that despite the origin of a matrix when we write it (and when you work with the row and column indices in R on it) is different than when we plot it. Two things should be noted:</span>

  1. The axes from <tt>image()</tt> are not very helpful as they are scaled to the fractional width of the matrix rather than the number of rows and columns. This is apparently the preferred behavior from the people who wrote the original R graphics package.
  2. The aspect ratio of the cells (e.g., each cell width and height) are not the same. This is problematic if we are intending these data to represent spatial content.

This matrix can be ‘decorated’ with additional attributes and turned into a raster object by casting it as one using the <tt>raster()</tt> function.

<pre class="lang:r decode:true">require(raster)
r <- raster( x )
r
## class : RasterLayer
## dimensions : 10, 10, 100 (nrow, ncol, ncell)
## resolution : 0.1, 0.1 (x, y)
## extent : 0, 1, 0, 1 (xmin, xmax, ymin, ymax) ## coord. ref. : NA
## data source : in memory
## names : layer
## values : -2.612584, 2.403894 (min, max)</pre>

If we plot the raster object, we get a different view.

<pre class="lang:r decode:true">plot(r)</pre>

<img class="aligncenter wp-image-860 size-large" src="wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.35.14-AM-1024x645.png" alt="Screen Shot 2016-03-18 at 11.35.14 AM" width="768" height="484" srcset="wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.35.14-AM-1024x645.png 1024w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.35.14-AM-300x189.png 300w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.35.14-AM-768x484.png 768w, wp-content/uploads/2016/03/Screen-Shot-2016-03-18-at-11.35.14-AM.png 1450w" sizes="(max-width: 768px) 100vw, 768px" /> 

&nbsp;

&nbsp;