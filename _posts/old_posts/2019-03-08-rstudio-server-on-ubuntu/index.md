---
title: RStudio Server on Ubuntu
date: "2019-03-08T11:02:47+00:00"
categories:
  - R
tags:
  - dyerlab
  - software
---
Ubuntu server is a nice platform for server-related activities. Here is a short tutorial of how I updated my most current version to the latest available by [rstudio.org](https://www.rstudio.com/). Here is how I got it going.

If this is your first install, you need to grab the gdebi stuff

```
sudo apt-get install gdebi-core 
```

Next download the latest deb from rstudio. I typically like to try out the [preview release](https://www.rstudio.com/products/rstudio/download/preview/), often stable enough to get what you want done while at the same time highlighting the latest features. When writing, it was the 1.2.1321 version.

<pre class="EnlighterJSRAW" data-enlighter-language="generic" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">wget https://s3.amazonaws.com/rstudio-ide-build/server/trusty/amd64/rstudio-server-1.2.1321-amd64.deb</pre>

Make sure to check the md5sum!

If you already have it running, stop it with 

<pre class="EnlighterJSRAW" data-enlighter-language="generic" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">sudo rstudio-server stop</pre>

then install the new version

<pre class="EnlighterJSRAW" data-enlighter-language="generic" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">sudo gdebi rstudio-server-1.2.1321-amd64.deb </pre>

This went out and grabbed some other libraries and installed everything for me then turned it back on. Since I had it already installed, that was the end of it. If this is the first time you are installing it, you can configure it following the installation guide [here](https://support.rstudio.com/hc/en-us/articles/360015079054).

<p class="sloc-display">
  <img class="icon-location" aria-label="Location: " aria-hidden="true" src="https://rodneydyer.com/wp-content/plugins/simple-location/location.svg" /><span class="p-location"><data class="p-latitude" value="37.500000"></data><data class="p-longitude" value="-77.400000"></data><a href="https://maps.wikimedia.org/#/14/37.5/-77.4">Richmond, Virginia</a></span><br />&nbsp;
</p>
