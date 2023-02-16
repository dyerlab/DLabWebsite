rm(list=ls())
library( tidyverse )


done <- c("https://github.com/DyerlabTeaching/Analysis-of-Variance")

probs <- c("https://github.com/DyerlabTeaching/Github-Classroom")

repos <- c( "https://github.com/DyerlabTeaching/Functions",
            "https://github.com/DyerlabTeaching/Regression",
            "https://github.com/DyerlabTeaching/Correlation",
            "https://github.com/DyerlabTeaching/Graphics-That-Do-Not-Suck",
            "https://github.com/DyerlabTeaching/Joins",
            "https://github.com/DyerlabTeaching/Tidyverse",
            "https://github.com/DyerlabTeaching/Factors",
            "https://github.com/DyerlabTeaching/Data-Containers" )


output <- "%%tana%%"

for( repo in repos ) { 
  
  readme_file <- gsub( paste(repo, "main/README.md", sep="/"),
                       pattern = "github.com",replacement = "raw.githubusercontent.com" )
  
  raw_file <- read_file( readme_file )
  
  ## Find the Title
  TITLE <- trimws( str_replace(str_split( raw_file, pattern="\n" )[[1]][1],
                               pattern = "#", replacement = ""))
  
  
  ## Find the Student Learning Objectives for the Lecture                    
  readme <- str_split( raw_file,
                       pattern = "## ")[[1]]
  slo <- str_replace_all( str_split( readme[str_detect( readme, 
                                                        "Student Learning Objectives")],
                                     pattern = "- ")[[1]],
                          pattern = "\n", replacement = "")
  if( length(slo) > 1 ) { 
    slo <- slo[2:length(slo)]
  }
  
  base_url <- str_split(repo, pattern="/")[[1]][-4:-1]
  slide_url <- paste("https://dyerlabteaching.github.io",base_url, "slides.html", sep="/")
  narrative_url <- paste("https://dyerlabteaching.github.io",base_url, "slides.html", sep="/")
  inclass_url <- paste("https://dyerlabteaching.github.io",base_url, "slides.html", sep="/")
  
  
  
  
  output <- c(output,
              paste("-", TITLE),
              paste("  -", TITLE, "Repository #[[github repository]]"),
              paste("    - URL::", repo),
              paste("  -", TITLE, "Slides #webpage"),
              paste("    - URL::", slide_url),
              paste("  -", TITLE, "Narrative #webpage"),
              paste("    - URL::", narrative_url),
              paste("  -", TITLE, "In Class Activity #webpage"),
              paste("    - URL::", inclass_url)
  )
  
  for( obj in slo) { 
    output <- c(output, 
                paste("  -", trimws(obj), "#[[learning objective]]"))
  }
  
  # Add on the final lecture
  output <- c(output, paste("  -", TITLE, "#lecture"))
  
  
  
  
  
  
  
}


full_output <- paste(output, collapse="\n")
write_file( full_output, file="test.txt")



