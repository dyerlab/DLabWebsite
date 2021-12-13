---
title: Compiling the GSL Library for OSX
date: 2015-07-29T10:45:53+00:00
guid: http://dyerlab.bio.vcu.edu/?p=544
permalink: /2015/07/29/compiling-the-gsl-library-for-osx/

categories:
  - Code
  - Tutorials
tags:
  - gene flow
  - gsl
  - population graphs
  - xcode
---
I've been working on integrating the Swift language into my analysis workflow but much of what I do involves the GNU Scientific Libraries for matrix analysis and other tools.  Here is a quick tutorial on how to install the GSL library on a clean OSX platform.

  1. It is easiest if you have XCode installed.  You can get this from the App Store for free.  Go download it and install it.
  2. Download the latest version of the GSL libraries.  You can grab them by: 
      1. Looking for your nearest mirror site listed at <http://www.gnu.org/prep/ftp.html> and connecting to it.
      2. Open the directory `gsl/` where all the versions will be listed.  Scroll down and grab `gsl-latest.tar.gz`.
  3. Open the terminal (Utilities -> Terminal.app) and type:  `cd ~/Downloads`
  4. Unpack the archive by:  `tar zxvf gsl-latest.tar.gz` then `cd gsl-1.16/` (or whatever the version actually was, it will probably be some number larger than 1.16).
  5. Inside that folder will be a README file (which you probably won't read) and an INSTALL file (which you should read).  In that folder it will tell you to:  `./configure` then  `make` then `sudo make install`. This last command will require you to type in your password as it is going to install something into the base system.
  6. All the libraries and header files will be installed into the `/usr/local/` directory.