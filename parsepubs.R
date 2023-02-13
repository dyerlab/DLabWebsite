rm(list=ls())

library( tidyverse )

files <- list.files("manuscripts",
                    pattern="Rmd", 
                    recursive = TRUE,
                    full.names = TRUE)

for( file in files ) { 
  
  name <- str_split(file, "/")[[1]][2]
  path <- paste(str_split(file, "/")[[1]][1:2], collapse="/")
  lines <- read_lines(file)
  idx <- which( lines == "---")
  header <- lines[ (idx[1]+1):(idx[2]-1)]
  
  # do the meta data
  cur <- 1
  for( i in 2:length(header)) {
    line <- header[i]
    line <- str_remove(line,"- name:")
    line <- str_remove(line, ": |")
    if( length( grep("^ ", line) ) > 0  ){
      header[cur] <- paste(header[cur], line) 
      header[i] <- ""
    }
    else {
      cur <- i
    }
  }

  header <- header[ nchar(header)>0]  
  header <- str_remove_all(header, "'")
  header <- str_remove_all(header, "\"")
  header <- str_replace(header, ": \\|", ": ")
  meta <- list()
  for( line in header) { 
    tmp <- str_split(line, ":")[[1]]
    if( length(tmp) == 2 ) { 
      key <- trimws(tmp[1])
      val <- trimws(tmp[2])
      if( key == "date") { 
        val <- paste( val, "12:01")
      }
      if( key == "authors"){ 
        val <- str_replace_all(val, "  ", ", ")
      }
      
      val <- str_replace_all( val, "   ", " ")
      val <- str_replace_all( val, "  ", " ")
      
      meta[key] <- trimws( val )
    }
  }
  
  
  mvCommand <- function( curpath, name, type=".png" ) { 
    featurename <- paste("images/",name,type, sep="")
    cmd <- paste( "cp", curpath, featurename )
    system(cmd)
    return( featurename )
  }
  
  # copy over featured images
  if( !("image" %in% names(meta)) ) { 
    meta[["featured"]] <- ""
    cat(name, "has no featured image\n")
  }
  else { 
    if( meta[["image"]] == "featured.png") { 
      curpath <- paste( path, "/featured.png", sep="")
      newpath <- mvCommand( curpath, name )
      cat(name, "moved", curpath,"\n")
      meta[["featured"]] <- newpath
    }
    else { 
      cat(name, "------------- CHECK \n")
    }
  }
  
  # Move any additional images
  imgs <- list.files(path, pattern="png",full.names = TRUE, recursive = TRUE)
  imgs <- imgs[ basename(imgs) != "featured.png" ]
  if( length(imgs)>0) {
    for( img in imgs) { 
      mvCommand( img, paste(name,".1", sep="") )
      cat(" added auxillary image")
    }
  }
  
  
  
  
  
    
  ofile <- "---"
  
  for( key in names(meta) ) { 
    if( (key %in% c("title","date","description","featured","tags") )) { 
      ofile <- c( ofile, 
                  paste( key, ": ", meta[[key]], sep=""))
      }
  }
  
  ofile <- c(ofile, "---", "")
  ofile <- c(ofile, lines[ (idx[2]+1):length(lines) ] )
  
  ofile <- paste( ofile, collapse="\n")
  fname <- paste("images/",name,".md",sep="")
  
  
  write_file(ofile, fname)
  
  
  
  
  
  
  
}
