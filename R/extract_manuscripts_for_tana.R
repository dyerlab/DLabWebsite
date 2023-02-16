rm(list=ls())
library( tidyverse )
library( yaml )



files <- list.files("../manuscripts",
                    full.names = TRUE, 
                    recursive = TRUE,
                    pattern = ".Rmd")

headers <- character(0)
for( file in files ) { 
  the_yml <- read_yaml( file )
  headers <- union( headers, names(the_yml))
}

headers
