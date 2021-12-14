rm(list = ls())
library( distill )
library( stringr )

files <- list.files(
  path = "old_posts",
  pattern = "index.Rmd",
  recursive = TRUE,
  full.names = TRUE
)

for (file in files) {
  print(file)
  lines <- readLines(file)
  
  # find the date 
  idx <- grep("date: ", lines, fixed = TRUE)
  date <- ""
  
  if (length(idx) == 1) {
    date <- str_sub( lines[idx], 7, 16)
  }
  
  # Find the second --- and put in the output type
  idx <- grep("---", lines, fixed = TRUE)
  content <- ""
  lines <- c(lines, " ", " ", " ")
  if (length(idx) == 2) {
    content <- paste( lines[ (idx[2]+1):length(lines) ] , collapse = "\n")
  }
  
  # find the title
  
  idx <- grep("title: ", lines, fixed=TRUE )
  title <- "No Title"
  if( length(idx)>0 ) { 
    title <- str_trim( gsub('[[:punct:] ]+', " ", str_remove(lines[idx], "title: ")))
  }
  
  ofile <- str_replace_all( tolower(title),  pattern=" ", replacement = "-" ) 
  nfile <- paste(date, ofile, sep="-") 
  path <- paste("_posts/",nfile,"/", ofile, ".Rmd", sep="")

  if( !file.exists(path) ) { 
    if( length(title) > 1 ) { 
      title <- title[1]
    }
    distill::create_post( title, collection="posts", date = date, date_prefix=date, edit = FALSE)
    cat( content, file = path, append=TRUE, sep="\n")  
  }
}


for( file in list.files(path="_posts/", 
                        pattern = "*.Rmd",
                        recursive = TRUE,
                        full.names = TRUE) ) { 
  
  rmarkdown::render( file )  
}




