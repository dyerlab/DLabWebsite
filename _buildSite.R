#' This file is how I'll build the site.
#' 
rm( list=ls() )
library( ymlthis )
library( jsonlite )


# load in and convert any of the markdown stuff in _toImport into 
#  distill articles.
files <- list.files("_toImport", pattern = "*.md", full.names = TRUE)
if( length( files ) > 0 ) { 
  
  for( file in files  ) { 
    
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
  
}



# Create software packages for the latest versions  To add more repositories, add data to the 
#   following data types.

repositories <- c("DLabSpatial",
                  "DLabMatrix",
                  "DLabGenetic",
                  "gstudio",
                  "popgraph")

readmes <- c( rep("/main/README.md", 3),
              rep("/master/README.md", 2 ) )

titles <- paste( repositories, 
                 c( rep(" Swift Package", 3), 
                    rep(" R Library Package", 2)), 
                 sep="")

descriptions <- c("A swift library package for the analysis and display of spatial data for analytical software targeting iOS and MacOS platforms.",
                  "A swift library package with matrix algebraic objects and functions necessary for landscape and population genetic analyses on the iOS and MacOS platforms.",
                  "A swift library package for the analyiss of marker and SNP relevant data types for landscape and population genetic analyses on the iOS and MacOS platforms.",
                  "An R package designed to allow the analysis of population genetic data as a native R data type, fully integrated with tidy data paradigms.",
                  "An R package for estimation, anslysis, and visualization of Population Graph objects after Dyer & Nason (2014).")

categories <- c( "Swift", "Swift", "Swift", 
                 "R", "R" ) 


# make each of the repos if necessary
for( i in 1:length( repositories ) ) { 
  repo <- repositories[i]
  readme <- readmes[i] 
  title <- titles[i]
  description <- descriptions[i]
  category <- categories[i]
  
  versionURL <- paste("https://api.github.com/repos/dyerlab/",
                      repo,
                      "/commits?path=README.md&page=1&per_page=1", sep = "")
  date <- stringr::str_sub( jsonlite::fromJSON(versionURL)$commit$author$date, 1, 10) 
  markdown <- paste( c("",
                       "```{r echo=FALSE, results='asis'}",
                       paste("url <- 'https://raw.githubusercontent.com/dyerlab/", repo, readme, "'", sep=""),
                       "content = readLines( url )",
                       "cat( paste(content, collapse=\"\n\") )",
                       "```",
                       "",
                       ""),
                     collapse="\n" )
  yml(date = FALSE) %>% 
    yml_title( title ) %>% 
    yml_author( name="Rodney Dyer", 
                email = "rjdyer@vcu.edu",
                url = "https://dyerlab.org",
                affiliation = "Center for Environmental Studies",
                affiliation_url = "https://ces.vcu.edu",
                orcid_id = "0000-0003-4707-3453") %>%
    yml_distill_opts( categories= category ) %>%
    yml_output( distill::distill_article( self_contained = FALSE) )  %>%
    yml_toplevel( date = date, 
                  description = description ) -> txt 
  
  dirname <- paste( "./_software/", repo, "/", sep="" ) 
  fname <- paste( dirname, "index.Rmd", sep = "" )
  
  if( !dir.exists(dirname) ) { 
    dir.create(dirname)
  }
  
  if( !file.exists( fname ) ) { 
    txt %>% 
      use_index_rmd( path=dirname, 
                     body=markdown,
                     open_doc = FALSE )
    rmarkdown::render(fname)
  } else { 
    oldyml <- readLines( fname )
    idx <- which( grepl( "date: ", oldyml) )
    olddate <- gsub("\'+", "", stringr::str_split( oldyml[idx], ": ")[[1]][2])
    if( date != olddate ) { 
      unlink( fname )
      txt %>% 
        use_index_rmd( path=dirname, 
                       body=markdown,
                       open_doc = FALSE )
      rmarkdown::render(fname)
    } 
  }
}


# clean up any of the crap on the site and render the whole thing.
system( "find . -type f -iname '.DS_Store' -delete")
rmarkdown::render_site(".")