---
title: Intalling Shiny Server on Ubuntu 14 LTS
date: 2016-06-05T14:34:56+00:00
guid: http://dyerlab.bio.vcu.edu/?p=972
permalink: /2016/06/05/intalling-shiny-server-on-ubuntu-14-lts/

categories:
  - Code
  - Documents
  - R
  - Tutorials
tags:
  - R
  - servers
  - software
---
OK, so I just &#8216;[found](http://shiny.rstudio.com)&#8216; shiny and it has a lot of cool stuff to it.  OK, I've known about it for a long time but have just had the opportunity to sit down and work it out and see how it can fit into the presentation and learning I'm trying to develop in my [Applied Population Genetics](http://popgen.bio.vcu.edu) online textbook.  Here is a brief overview of how I set up the shiny server on my Ubuntu box that is hosting the book (so I can embed more interactivity in the display).

<!--more-->

OK, below are the steps that I'm taking to upgrade everything on the box and install the shiny server app and start hosting individual shiny apps.

## Updating Background & Installing Necessary Components

First, you should update to the latest releases.  I'm running a LTS version (long-term support) so it is pretty stark.

<pre class="lang:sh decode:true">sudo apt-get update
sudo apt-get upgrade</pre>

Next, I needed to install the following development libraries so that things will go easily.

<pre class="lang:sh decode:true">sudo apt-get install libssl-dev
sudo apt-get install gdebi-core
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""</pre>

And then we can use the <span class="lang:r decode:true crayon-inline ">gdebi</span>  framework to install the the server

<pre class="lang:sh decode:true ">wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.4.2.786-amd64.deb
sudo gdebi shiny-server-1.4.2.786-amd64.deb</pre>

This puts the conf file in <span class="lang:r decode:true crayon-inline ">/etc/init/shiny-server.conf</span> , sets up the user <span class="lang:r decode:true crayon-inline ">shiny</span>  (and has a home directory), and starts the shiny-server process.

## Redirecting URL Requests

At this point the shiny-server is running and is servubg pages on port 3838.  However, I block all ports other than 22 and 80 for security, so what I want to do is to redirect requests to my server asking for anything in the subdirectory [http://popgen.bio.vcu.edu/shiny](http://popgen.bio.vcu.edu/shiny/) to redirect to [http://127.0.0.1:3838](http://127.0.0.1:3838/) locally.  I need to do this by fiddling with the Apache configuration scripts.

Apache on Ubuntu puts configuration scripts in /etc/apache2/sites-available and symliks them to /etc/apache2/sites-enabled.  In this file, I set up a proxy pass so that any url that is asking for stuff in the /shiny/ subdirectory be redirected to the 3838 port on this machine.  At the end of the section for this server, enclosed in <span class="lang:r decode:true crayon-inline "><VirtualHost *:80></span> <span class="s1">, I put the following in:</span>

<pre class="lang:sh decode:true">RewriteCond %{HTTP:Upgrade} =websocket
RewriteRule /shiny/(.*) ws://localhost:3838/$1 [P,L]
RewriteCond %{HTTP:Upgrade} !=websocket
RewriteRule /shiny/(.*) http://localhost:3838/$1 [P,L]
ProxyPass /shiny/ http://localhost:3838/        
ProxyPassReverse /shiny/ http://localhost:3838/</pre>

You need to make sure that the following mod are turned on for apache:

  * mod_proxy
  * mod\_proxy\_html
  * mod\_proxy\_wstunnel

Enable them the way that is appropriate for your server.  On Ubuntu it is:

<pre class="lang:sh decode:true">a2enmod mod_proxy
a2enmod mod_proxy_html
a2enmod mod_proxy_wstunnel</pre>

## Restart Apache

All that is left to do now is restart apache and check to see the startup screen for all shiny apps on the <http://popgen.bio.vcu.edu/shiny/> page.

<pre class="lang:sh decode:true">sudo service apache2 restart</pre>

The first shiny app to be integrated into the Applied Population Genetics textbook is located in the Hardy-Weinberg chapter.  It is embedded as:

<pre></pre>

And creates the following widget in the book (go ahead and play with it, it is interactive):



This opens a whole slew of interactive graphics for the textbook!