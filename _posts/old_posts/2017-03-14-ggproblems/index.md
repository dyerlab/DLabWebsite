---
title: ggproblems
date: 2017-03-14T07:42:13+00:00
guid: https://dyerlab.ces.vcu.edu/?p=1124
permalink: /2017/03/14/ggproblems/
categories:
  - R
tags:
  - R
---
OK, so there is a bit of a circular firing squad going on in some of my R installs with ggplot2.  Apparently, you can get various CRAN/Github versions out of sync and a whole host of different.  Here is how it started:

<!--more-->

<pre class="lang:r decode:true">&gt; df <- data.frame(x=runif(20),y=runif(20),z=runif(20))
&gt; library(ggtern)
Loading required package: ggplot2
--
Consider donating at: http://ggtern.com
Even small amounts (say $10-50) are very much appreciated!
Remember to cite, run citation(package = 'ggtern') for further info.
--

Attaching package: ‘ggtern’

The following objects are masked from ‘package:ggplot2’:

    %+%, aes, annotate, calc_element, ggplot, ggplot_build,
    ggplot_gtable, ggplotGrob, ggsave, layer_data, theme, theme_bw,
    theme_classic, theme_dark, theme_gray, theme_light, theme_linedraw,
    theme_minimal, theme_void

&gt; ggtern(df,aes(x,y,z))
Error in f(..., self = self) : unused argument (&lt;environment&gt;)</pre>

hmmm&#8230;.  Then ggmap also died.

To fix this, I did the following:

  1. Removed ggtern, ggplot2, and ggmap from my library
  2. Installed ggplot2 from CRAN
  3. Installed ggmap from GitHub
  4. Installed ggtern from Bitbucket (why not github, I don't know).

Seems to work now.