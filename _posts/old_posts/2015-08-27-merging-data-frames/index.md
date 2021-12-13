---
title: Merging data frames
date: 2015-08-27T12:39:08+00:00
guid: http://dyerlab.bio.vcu.edu/?p=609
permalink: /2015/08/27/merging-data-frames/
categories:
  - Code
  - Tutorials
tags:
  - Baja California
  - Lophocereus schottii
  - popgraph
  - R
---
In R, there is often the need to merge two <span class="lang:default decode:true crayon-inline ">data.frame</span> objects (say one with individual samples and the other with population coordinates.  The <span class="lang:default decode:true crayon-inline ">merge()</span>  function is a pretty awesome though it may take a little getting used to.  
Here are some things to remember:

  1. You need to have two <span class="lang:default decode:true crayon-inline ">data.frame</span> objects to merge
  2. The first one in the function call will be the one merged _on-to _the second one is added to the first.
  3. Each will need a column to use as an index—it is a column that will be used to match rows of data.  If they are the same column names then the function will do it automagically, if no common names are found in the <span class="lang:default decode:true crayon-inline ">names()</span>  of either <span class="lang:default decode:true crayon-inline">data.frame</span> objects, you can specify the columns using the optional <span class="lang:default decode:true crayon-inline ">by.x=</span>  and <span class="lang:default decode:true crayon-inline ">by.y=</span>  function arguments.

<!--more-->Here is an example. I'm going to load in some data from the 

<span class="lang:default decode:true crayon-inline ">popgraph</span>  library.  First, I'll load up the library and hten grab the population meta data for the lophocereus data set we analyzed in [Dyer & Nason (2004)](http://dx.doi.org/10.1111/j.1365-294X.2004.02177.x).

<pre class="lang:default decode:true ">require(popgraph)
data(baja)
summary(baja)
    Region     Population    Latitude       Longitude     
 Baja  :16   BaC    : 1   Min.   :22.93   Min.   :-114.7  
 Sonora:13   Cabo   : 1   1st Qu.:24.45   1st Qu.:-112.6  
             CP     : 1   Median :27.95   Median :-111.8  
             Ctv    : 1   Mean   :27.33   Mean   :-111.8  
             ELR    : 1   3rd Qu.:29.59   3rd Qu.:-110.7  
             IC     : 1   Max.   :31.95   Max.   :-109.5  
             (Other):23                                   
</pre>

The graph itself has nodes indicated as populations and perhaps we are interested in plotting node size as a function of spatial location.  We can grab the names and sizes from the <span class="lang:default decode:true crayon-inline">popgraph</span> object (it is a kind of <span class="lang:default decode:true crayon-inline ">igraph</span> ) by:

<pre class="lang:default decode:true ">data(lopho)
df.nodes <- data.frame( Population=V(lopho)$name, Size=V(lopho)$size )
summary(df.nodes)
   Population      Size       
 BaC    : 1   Min.   : 2.500  
 CP     : 1   1st Qu.: 5.291  
 Ctv    : 1   Median : 6.860  
 LaV    : 1   Mean   : 7.770  
 LF     : 1   3rd Qu.:10.925  
 Lig    : 1   Max.   :16.001  
 (Other):15</pre>

Now we have <span class="lang:default decode:true crayon-inline">baja</span>  and <span class="lang:default decode:true crayon-inline">df.nodes</span> as two data.frames and can merge them by their common column \`Population\`.  If we merge <span class="lang:default decode:true crayon-inline">df.nodes</span>onto <span class="lang:default decode:true crayon-inline ">baja</span>  then we get the new <span class="lang:default decode:true crayon-inline">data.frame</span>:

<pre class="lang:default decode:true ">merge( baja, df.nodes )
   Population Region Latitude Longitude      Size
1         BaC   Baja    26.59   -111.79 12.158810
2          CP Sonora    27.95   -110.66  7.870725
3         Ctv   Baja    29.73   -114.72  3.880886
4         LaV   Baja    24.04   -109.99  3.533757
5          LF Sonora    30.68   -112.27  8.472215
6         Lig   Baja    25.73   -111.27  4.731355
7          PL Sonora    30.39   -112.58  6.692795
8         PtC   Baja    24.19   -111.15  4.684652
9         PtP   Baja    29.03   -113.90 10.925375
10     SenBas Sonora    31.95   -112.87  9.116705
11       Seri Sonora    28.88   -111.96  2.500000
12         SG Sonora    29.40   -112.05 11.027530
13         SI Sonora    29.75   -112.50 11.521450
14        SLG   Baja    29.59   -114.40  5.955645
15         SN Sonora    28.82   -111.80  8.325785
16        SnE   Baja    24.45   -110.70 11.828220
17        SnF   Baja    30.76   -114.73  6.325655
18        SnI   Baja    27.29   -113.02  5.466695
19        StR   Baja    24.91   -111.62  6.859545
20         TS Sonora    28.41   -111.37 16.001165
21        TsS   Baja    23.58   -110.34  5.290570</pre>

but if we do it the other way, we get:

<pre class="lang:default decode:true ">merge(df.nodes,baja)
   Population      Size Region Latitude Longitude
1         BaC 12.158810   Baja    26.59   -111.79
2          CP  7.870725 Sonora    27.95   -110.66
3         Ctv  3.880886   Baja    29.73   -114.72
4         LaV  3.533757   Baja    24.04   -109.99
5          LF  8.472215 Sonora    30.68   -112.27
6         Lig  4.731355   Baja    25.73   -111.27
7          PL  6.692795 Sonora    30.39   -112.58
8         PtC  4.684652   Baja    24.19   -111.15
9         PtP 10.925375   Baja    29.03   -113.90
10     SenBas  9.116705 Sonora    31.95   -112.87
11       Seri  2.500000 Sonora    28.88   -111.96
12         SG 11.027530 Sonora    29.40   -112.05
13         SI 11.521450 Sonora    29.75   -112.50
14        SLG  5.955645   Baja    29.59   -114.40
15         SN  8.325785 Sonora    28.82   -111.80
16        SnE 11.828220   Baja    24.45   -110.70
17        SnF  6.325655   Baja    30.76   -114.73
18        SnI  5.466695   Baja    27.29   -113.02
19        StR  6.859545   Baja    24.91   -111.62
20         TS 16.001165 Sonora    28.41   -111.37
21        TsS  5.290570   Baja    23.58   -110.34</pre>

Hope this helps.