---
title: Color palettes in ggpairs
date: 2015-03-26T10:40:39+00:00
guid: http://dyerlab.bio.vcu.edu/?p=407
permalink: /2015/03/26/color-palettes-in-ggpairs/
categories:
  - Code
---
Working on some code and was having a tough time configuring the color palette in GGally since it does not produce a ggplot object.  It appears to be a larger problem.  So, here is one hack, redefine the ggplot function and change the default palette there.  Need to make a dyerlab::palette now&#8230;

<pre>ggplot <- function(...) ggplot2::ggplot(...) + scale_color_brewer(palette="Set1")
unlockBinding("ggplot",parent.env(asNamespace("GGally")))
assign("ggplot",ggplot,parent.env(asNamespace("GGally")))
require(GGally)</pre>

<pre>ggpairs(df,columns = 3:7,axisLabels="none",color="color")</pre>