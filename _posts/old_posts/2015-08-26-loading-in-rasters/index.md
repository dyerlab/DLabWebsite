---
title: Loading in Rasters
date: 2015-08-26T09:35:30+00:00
guid: http://dyerlab.bio.vcu.edu/?p=592
permalink: /2015/08/26/loading-in-rasters/
categories:
  - Code
  - Tutorials
tags:
  - R
  - spatial
---
Much of the work in my laboratory uses spatial data in some context.  As such it is important to try to be able to grab and use spatial data to in an easy fashion.  At present, R is probably the best way to grab, visualize, and analyze spatial data. For this example, I went to <http://worldclim.org> and downloaded the elevation (altitude) for tile 13 (eastern North America) as a GeoTiff.  A GeoTiff is a specific type of image format that has spatial data contained within it.  The tile data has a pixel resolution of 30 arc seconds which puts us in the general area of ~ 1km.   First, we need to get things set up to work.

<pre class="lang:default decode:true "># Set the working directory to where you want it.
setwd("~/Downloads")

# load in the raster library
require(raster)
Loading required package: raster
Loading required package: sp</pre>

<!--more-->Then we can load in and visualize the data.

<pre class="lang:r decode:true">r <- raster("alt_13.tif")
plot(r)
</pre>

<img class="alignnone size-full wp-image-604" src="wp-content/uploads/2015/08/Rplot.png" alt="Rplot" width="949" height="717" srcset="wp-content/uploads/2015/08/Rplot.png 949w, wp-content/uploads/2015/08/Rplot-300x227.png 300w, wp-content/uploads/2015/08/Rplot-768x580.png 768w" sizes="(max-width: 949px) 100vw, 949px" /> 

We can see what the raster relates to by looking at the extent.

<pre class="lang:r decode:true">extent(r)
class       : Extent 
xmin        : -90 
xmax        : -60 
ymin        : 30 
ymax        : 60</pre>

or its contents.

<pre class="lang:default decode:true ">print(r)
class       : RasterLayer 
dimensions  : 3600, 3600, 12960000  (nrow, ncol, ncell)
resolution  : 0.008333333, 0.008333333  (x, y)
extent      : -90, -60, 30, 60  (xmin, xmax, ymin, ymax)
coord. ref. : +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 
data source : /Users/rodney/Downloads/alt_13.tif 
names       : alt_13 
values      : -98, 1961  (min, max)</pre>

And you are off to the races.  This should get you going with the data.  Other posts you may be interested in looking at are found by [here](http://dyerlab.bio.vcu.edu/tag/r/).