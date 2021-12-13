---
title: 'New Package &#8211; dlab'
date: 2016-04-15T12:53:22+00:00
guid: http://dyerlab.bio.vcu.edu/?p=915
permalink: /2016/04/15/new-plugin-dlab/
categories:
  - Code
---
I just uploaded a new plugin for RStudio called dlab.  I'll be migrating over all the little helper functions I use to this as a general require() on startup.  What it has now is an AddIn that allows you to select text and have it wrapped in the r-code markup.  I'm moving stuff between ePub and Markdown and it was needed.

You can install it as:

<pre class="lang:r decode:true">devtools::install_github("dyerlab/dlab")</pre>

then look at the AddIns menu for wrapCode.