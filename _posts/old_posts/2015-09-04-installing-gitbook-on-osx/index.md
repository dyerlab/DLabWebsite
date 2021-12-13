---
title: Installing Gitbook on OSX
date: 2015-09-04T14:13:30+00:00
guid: http://dyerlab.bio.vcu.edu/?p=639
permalink: /2015/09/04/installing-gitbook-on-osx/
categories:
  - Uncategorized
---
I am in various stages of writing technical texts using R/RStudio/knitr and have been looking for some methods that help in this process.  My goals are to be able to:

  1. Maintain a single source tree that can produce the text (including graphics, statistical analyses, etc). easily
  2. Be able to produce high quality typesetting
  3. Be able to easily make epub
  4. Include both Code and output in the text.

I've just run across Gitbook and it looks like a good option, particularly with the help of the R package Rgitbook.   Here is a bit of work that I had to do to get things going on my machine.

<!--more-->

You will need to make sure you have XCode installed (get it from Apple) for all the building tools.  If you've had previous versions of XCode on your machine, you may need to reset <span class="lang:default decode:true crayon-inline ">xcode-select</span>  as:

<pre class="lang:default decode:true">sudo xcode-select -s /Applications/Xcode.app/Contents/Developer/
</pre>

  1. Download Node.js from their [site](https://nodejs.org/en/).
  2. In R, install <span class="lang:default decode:true crayon-inline ">devtools</span>  and then <span class="lang:default decode:true crayon-inline ">require(&#8220;devtools&#8221;)</span>  and <span class="lang:default decode:true crayon-inline ">install_github(&#8220;jbryer/Rgitbook&#8221;)</span>
  3. Try to install it as per the instruction here.  If this doesn't help, what I had to do was: 
      1. Try <span class="lang:default decode:true  crayon-inline ">sudo npm install gitbook -g</span>
      2. If this fails, you need to clean the npm cache and figure out what the problems were.  Depending upon your error message you may need to: 
          * Clean up any locks: 
                sudo chown -R $(whoami) ~/.npm/_locks
        
          * Clean the cache <pre class="lang:default decode:true">sudo npm cache clean</pre>
    
      3. Then install <span class="lang:default decode:true  crayon-inline ">sudo npm install gitbook-plugins -g</span>  and <span class="lang:default decode:true  crayon-inline ">sudo npm install gitbook-cli -g</span>  and you should be good.
  4. You should be able to go to R and <span class="lang:default decode:true  crayon-inline ">require(Rgitbook)</span>  and then <span class="lang:default decode:true  crayon-inline">checkForGitbook()</span>  and get normal feedback.

Now you have it installed, you should go see <http://jason.bryer.org/Rgitbook/> for how to use it.  Good luck!  It seems like this R package hasn't been updated in a while.  I hope it isn't stale, it looks pretty interesting.