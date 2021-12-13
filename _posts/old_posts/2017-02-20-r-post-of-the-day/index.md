---
title: R Post of the Day
date: 2017-02-20T09:06:36+00:00
guid: https://dyerlab.bio.vcu.edu/?p=1088
permalink: /2017/02/20/r-post-of-the-day/
categories:
  - Uncategorized
---
Fancy pie chart (thanks, [yihui](https://github.com/yihui), you are a genius):

<pre class="lang:r decode:true">par(mar = c(0, 1, 0, 1))
pie(
  c(280, 60, 20),
  c('Sky', 'Sunny side of pyramid', 'Shady side of pyramid'),
  col = c('#0292D8', '#F7EA39', '#C4B632'),
  init.angle = -50, border = NA
)</pre>

<img class="aligncenter wp-image-1089 size-large" src="wp-content/uploads/2017/02/pie-1-1024x731.png" width="768" height="548" srcset="wp-content/uploads/2017/02/pie-1-1024x731.png 1024w, wp-content/uploads/2017/02/pie-1-300x214.png 300w, wp-content/uploads/2017/02/pie-1-768x549.png 768w, wp-content/uploads/2017/02/pie-1.png 1344w" sizes="(max-width: 768px) 100vw, 768px" />