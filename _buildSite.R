#' This file is how I'll build the site.
#' 
rm( list=ls() )


# load in and convert any of the markdown stuff in _toImport into 
#  distill articles.
for( file in list.files("_toImport", pattern = "*.md", full.names = TRUE) ) { 
  
  # find previous stuff
  raw <- readLines( file )
  date <- stringr::str_split( file.info(file)$mtime , " ", simplify = TRUE)[,1] 
  title <- stringr::str_remove( raw[1], "# ") 
  description <- raw[3]
  contents <- paste( raw[ -(1:3) ], collapse="\n")
  
  # make new post  will create 
  filetitle <- gsub("[[:punct:][:blank:]]+", "-", title ) 
  filetitle <- tolower(filetitle)
  orig_title <- paste( "_posts/", date, "-", filetitle, "/", filetitle,".Rmd", sep="" )
  
  distill::create_post( filetitle, 
                        date = date,
                        edit = FALSE )
  
  raw_post <- readLines( orig_title )
  raw_post[2] <- paste( "title: \"", title, "\"" )
  raw_post[4] <- paste( "  ", description, sep=" ")
  raw_post[7] <- "    url: https://dyerlab.org\n    affiliation: Center for Environmental Studies\n    affiliation_url: https://ces.vcu.edu\n    orcid_id: 0000-0003-4707-3453"
  raw_post[8] <- paste( raw_post[8], "preview: featured.png", sep="\n")
  raw_post <- c( raw_post[1:13], contents ) 
  raw_post_output <- paste( raw_post, collapse="\n")
  
  new_file <- paste( "_posts/", date, "-", filetitle, "/", "index.Rmd", sep="" )
  writeLines( raw_post_output, con = new_file )
  
  # clean up the posts
  unlink( orig_title )
  unlink( file ) 
  
  rmarkdown::render( new_file )
}




# Create software packages for the latest versions



readme <- c("https://raw.githubusercontent.com/dyerlab/DLabSpatial/main/README.md")
title <- c("DLabSpatial Swift Package")
description <- c("A swift library package for the analysis and display of spatial data for analytical software targeting iOS and MacOS platforms.")
categories <- c("Swift")



curl -s "https://api.github.com/repos/user/project-name/commits?path=filename&page=1&per_page=1" | jq -r '.[0].commit.committer.date'

yml() %>% 
  yml_title( title ) %>% 
  yml_author( name="Rodney Dyer", 
            email = "rjdyer@vcu.edu",
            url = "https://dyerlab.org",
            affiliation = "Center for Environmental Studies",
            affiliation_url = "https://ces.vcu.edu",
            orcid_id = "0000-0003-4707-3453") %>%
  yml_distill_opts( categories=categories ) -> txt 


txt$output = "distill::distill_article"

txt



















# clean up any of the crap on the site and render the whole thing.
system( "find . -type f -iname '.DS_Store' -delete")
rmarkdown::render_site(".")