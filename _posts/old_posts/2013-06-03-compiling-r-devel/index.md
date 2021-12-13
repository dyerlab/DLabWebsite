---
title: Compiling r-devel
date: 2013-06-03T08:07:17+00:00
guid: http://rampages.us/dyerlab/?p=287
permalink: /2013/06/03/compiling-r-devel/
categories:
  - Tutorials
---
There are several reasons why, as someone that contributes packages to R, that you should consider using r-devel instead of the latest release.  Primary among these reasons are the fact that there may be changes in r-devel that are not in the latest release version and the maintainers will ding you for not using the correct version.  For whatever reason, it is a good idea and here are the notes I’ve put together to compile it on OSX (at the time this was written I was using 10.8.3).

# Requirements

First among the requirements is the OS X development environment.  This includes all the compilers and associated tools you’ll need.  You can get these directly from Apple through the App Store.

You will also need:

  1. _Subversion_.  This is some very useful software for source code development and collaboration.  This can be installed once you install the XCode stuff from Apple.  svn is part of the ‘command line tools’ that the package provides.  However, it is not automatically installed, you’ll have to do it after installing XCode directly.
  2. _gfortran-4.2X_.  This is found on the R webpage.  Go to the Mac download and then the ‘tools’ directory.  Download and install it.

# Installation

Here is the general approach I used, that seemed to work.

  1. Grab the latest version of r-devel.It should be noted that there is currently no certificate for this, so you'll have to believe that there is no malicious code in the bundle. <pre class="lang:default decode:true">svn checkout https://svn.r-project.org/R/trunk/ r-devel</pre>

  2. Grab the recommended packages that are not part of the r-devel distribution (you’ll need these or things will go pear shaped). <pre class="">./tools/rsync-recommended</pre>

  3. If you are using OSX Mavericks, you may need to install the command line tools first (this only needs to be done once).  Type this: <pre class="">xcode-select --install</pre>

  4. Configure the compilation.  I just grabbed these options from the default ones the binary OSX version uses. <pre class="">./configure 'CFLAGS=-mtune=core2 -g -O2' 'CXXFLAGS=-mtune=core2 -g -O2' 'OBJCFLAGS=-mtune=core2 -g -O2' 'FCFLAGS=-g -O2' 'F77FLAGS=-g -O2' '--with-system-zlib' '--enable-memory-profiling' '--disable-openmp' '--with-tcltk=/usr/local/lib' --with-x=no</pre>

  5. Make the base packages 
    <pre>make</pre>

  6. Check the compilation for any potential errors. 
    <pre>make check</pre>

  7. Make the vignettes 
    <pre>make vignettes</pre>

  8. Make the manuals (an optional part here but if you are going to go through all this, you might as well do it completely).  I compile them as PDF. 
    <pre>make pdf</pre>

  9. Install it 
    <pre>$ sudo make install</pre>

# Updating

One of the benefits of having a svn repository locally is that you can just update it the next time that you need it and rebuild the components that have changed.  To update the repository simply issue the following command in the directory with the r-devel folder.

<pre class="">svn up</pre>

Then you can rebuild as outlined above.