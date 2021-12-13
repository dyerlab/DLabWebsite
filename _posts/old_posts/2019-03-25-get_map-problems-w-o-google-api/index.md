---
title: get_map() Problems w/o Google API
date: 2019-03-25T11:21:35+00:00
categories:
  - R
tags:
  - dyerlab
---
There is a persistent problem with the get_map() function now that the google api is required. Even if you ask for source=&#8221;stamen&#8221; you still get an error asking for the google api. A fix is to do the following:

```
library(gstudio)
data(arapat)
coords <- strata_coordinates(arapat)
b1 <- c( left = -114.2935,
         bottom = 23.0757,
         right = -109.1263,
         top=  29.32541)

map <- get_stamenmap( bbox = b1, zoom=7 )
ggmap(map)
```


