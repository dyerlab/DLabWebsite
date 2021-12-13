---
title: Using Google Drive as an R Data Repository
date: 2018-07-19T13:14:45+00:00
categories:
  - Uncategorized
tags:
  - dyerlab
---
This is such a common thing to do these days, it is easier to just post this here rather than search through my class notes each time someone asks me how to do this.

Here is the issue.  Say you have some data associated with your research project and are adding to it and doing analyses.  Chances are, you have it shoved into an Excel spreadsheet that is on your laptop, your home computer, the computer in the lab, a backup disk (you are keeping backups, right?), and even perhaps shared on a Cloud Drive with your collaborators/advisors/partner/whatever.  Great!  Now you have absolutely no way to know which version of the dataset is the real one and which are **wrong**.


## Publishing Spreadsheets from Google Drive

In R, we can use the ability to serve out spreadsheet-like data as *.csv files using Google Drive.  This way, the data are in one (and only one) location and can be accessed by anyone you would like to grant access.  Here is how to set it up.

First, on Google Drive, you need to tell it to make a spreadsheet available and how to publish it.  This is done from the menu as **File -> Publish** to the Web&#8230;  A dialog box will pop up, like the one below, and let you select which sheet is published and what it is published as.  The salient part here is that you should select **Comma separated values (*.csv)** as the output type.  The URL that is provided in the image below should be copied as we will be using it in R to grab the data.<figure class="wp-block-image">

<img src="https://rodneydyer.com/wp-content/uploads/2018/07/2018-07-19_11-43-47.png" alt="Dialog from Google Docs allowing you to select the sheet to be published and the format it will be published in." class="wp-image-2098" srcset="https://rodneydyer.com/wp-content/uploads/2018/07/2018-07-19_11-43-47.png 565w, https://rodneydyer.com/wp-content/uploads/2018/07/2018-07-19_11-43-47-274x300.png 274w" sizes="(max-width: 565px) 100vw, 565px" /> </figure> 

Next, you can fire up R (I use RStudio as a sane interface) and make sure you have the RCurl library installed.  If not, install it like this:

<pre class="crayon-plain-tag">install.packages("RCurl")</pre>

So to load the file from Google Drive, we need to format the URL from Google Drive

<pre class="crayon-plain-tag">require(RCurl)
link <- "https://docs.google.com/spreadsheets/d/1QL9fYeKkDKphba12WLVTBJrv_d1WHTc9SrZoBeIFgj8/pub?gid=0&amp;single=true&amp;output=csv"
url <- getURL( link )</pre>

Then open an internet connection asking for a text-based communication between Google Drive and your R session

<pre class="crayon-plain-tag">con <- textConnection( url )</pre>

and then pull the data into R as if it was on the local filesystem.

<pre class="crayon-plain-tag">data <- read.csv( con )</pre>

And your data should be there.

<pre class="crayon-plain-tag">summary(data)

#   Population       SampleID      X.Coordinate   Y.Coordinate      Cf.G8      
# Min.   :2.000   Min.   :203.0   Min.   : 346   Min.   : 254   Min.   :147.0  
# 1st Qu.:3.000   1st Qu.:315.5   1st Qu.:1482   1st Qu.:2231   1st Qu.:155.0  
# Median :4.000   Median :428.0   Median :1656   Median :2928   Median :157.0  
# Mean   :3.809   Mean   :428.0   Mean   :1747   Mean   :2588   Mean   :160.3  
# 3rd Qu.:5.000   3rd Qu.:540.5   3rd Qu.:1914   3rd Qu.:3082   3rd Qu.:165.0  
# Max.   :6.000   Max.   :653.0   Max.   :3778   Max.   :6148   Max.   :199.0  
#                                                               NAs   :9      
#       X           Cf.H18           X.1            Cf.N5            X.2     
# Min.   :149   Min.   : 83.0   Min.   : 83.0   Min.   :148.0   Min.   :150  
# 1st Qu.:161   1st Qu.: 99.0   1st Qu.:107.0   1st Qu.:165.0   1st Qu.:170  
# Median :167   Median :105.0   Median :115.0   Median :170.0   Median :170  
# Mean   :172   Mean   :104.5   Mean   :112.8   Mean   :167.7   Mean   :170  
# 3rd Qu.:181   3rd Qu.:111.0   3rd Qu.:119.0   3rd Qu.:170.0   3rd Qu.:170  
# Max.   :519   Max.   :123.0   Max.   :123.0   Max.   :172.0   Max.   :172  
# NAs   :9     NAs   :1       NAs   :1       NAs   :36      NAs   :36   
#     Cf.N10           X.3            Cf.O5            X.4       
 Min.   :171.0   Min.   :175.0   Min.   :176.0   Min.   :176.0  
# 1st Qu.:187.0   1st Qu.:193.0   1st Qu.:178.0   1st Qu.:182.0  
 Median :189.0   Median :197.0   Median :182.0   Median :194.0  
# Mean   :189.4   Mean   :196.3   Mean   :182.5   Mean   :190.3  
 3rd Qu.:193.0   3rd Qu.:201.0   3rd Qu.:182.0   3rd Qu.:196.0  
# Max.   :205.0   Max.   :205.0   Max.   :202.0   Max.   :204.0  
 NAs   :13      NAs   :13      NAs   :8       NAs   :8</pre>
