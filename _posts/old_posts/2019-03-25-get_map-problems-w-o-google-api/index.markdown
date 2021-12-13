---
author: rodney
date: 2019-03-25 16:21:35+00:00
draft: false
title: get_map() Problems w/o Google API
type: post
url: /2019/03/25/get_map-problems-w-o-google-api/
categories:
- Dyerlab
- R
---
There is a persistent problem with the get_map() function now that the google api is required.  Even if you ask for source="stamen" you still get an error asking for the google api.  A fix is to do the following:
    
    <code>library(gstudio)
    data(arapat)
    coords <- strata_coordinates(arapat)
    b1 <- c( left = -114.2935,
             bottom = 23.0757,
             right = -109.1263,
             top=  29.32541)
    
    map <- get_stamenmap( bbox = b1, zoom=7 )
    ggmap(map)
    </code>

