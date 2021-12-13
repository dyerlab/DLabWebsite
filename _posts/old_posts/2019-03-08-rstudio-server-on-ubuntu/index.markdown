---
author: rodney
date: 2019-03-08 16:02:47+00:00
draft: false
title: RStudio Server on Ubuntu
type: post
url: /2019/03/08/rstudio-server-on-ubuntu/
categories:
- Dyerlab
- R
- Software
---
Ubuntu server is a nice platform for server-related activities.  Here is a short tutorial of how I updated my most current version to the latest available by [rstudio.org](https://www.rstudio.com).  Here is how I got it going.

If this is your first install, you need to grab the gdebi stuff
    
    sudo apt-get install gdebi-core

Next download the latest deb from rstudio.  I typically like to try out the [preview release](https://www.rstudio.com/products/rstudio/download/preview/), often stable enough to get what you want done while at the same time highlighting the latest features. When writing, it was the 1.2.1321 version.
    
    wget https://s3.amazonaws.com/rstudio-ide-build/server/trusty/amd64/rstudio-server-1.2.1321-amd64.deb

Make sure to check the md5sum!

If you already have it running, stop it with 
    
    sudo rstudio-server stop

then install the new version
    
    sudo gdebi rstudio-server-1.2.1321-amd64.deb 

This went out and grabbed some other libraries and installed everything for me then turned it back on.  Since I had it already installed, that was the end of it.  If this is the first time you are installing it, you can configure it following the installation guide [here](https://support.rstudio.com/hc/en-us/articles/360015079054).

