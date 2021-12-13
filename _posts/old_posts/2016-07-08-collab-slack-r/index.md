---
title: 'Collab <- Slack + R'
date: 2016-07-08T12:54:07+00:00
guid: http://dyerlab.bio.vcu.edu/?p=1021
permalink: /2016/07/08/collab-slack-r/

categories:
  - Applied Population Genetics
  - Code
  - Documents
  - R
  - Tutorials
tags:
  - R
  - Reproducible research
  - slack
---
I just ran across an R package that allows you to integrate your R workflow into the [Slack](http://www.slack.com) environment.  Really cool.  Below I show how to set it up and to post output of your analyses to slack channels for your team as well as to register notifications.

<!--more-->

[<img class="aligncenter size-medium wp-image-1022" src="wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-11.17.56-AM-300x141.png" alt="Screen Shot 2016-07-08 at 11.17.56 AM" width="300" height="141" srcset="wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-11.17.56-AM-300x141.png 300w, wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-11.17.56-AM-768x362.png 768w, wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-11.17.56-AM.png 968w" sizes="(max-width: 300px) 100vw, 300px" />](wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-11.17.56-AM.png)

First things first, I recommend installing the latest version from the [github](https://github.com/hrbrmstr/slackr) repository.

<pre class="lang:r decode:true">library(devtools)
install_github("hrbrmstr/slackr")
</pre>

Now you have to set up a config file.  I think it looks for it in <span class="lang:r decode:true crayon-inline ">~/.slackr</span>  It is a normal Debian Control File (DCF) format.  Here is my example one:

<pre class="lang:sh decode:true">api_token: xoxp-XXXXXXXXXXX-XXXXXXXXX-XXXXXXXXXX-XXXXXXXXX
channel: #r
username: rodney
incoming_webhook_url: https://hooks.slack.com/services/XXXXXXXX/XXXXXXXX/XXXXXXXX</pre>

You need to get the <span class="lang:r decode:true crayon-inline ">api_token</span>  and the <span class="lang:r decode:true crayon-inline ">incoming_webhook_url</span>  from slack itself.    Once you have that file saved, when you want to setup the slackr environment, you load it in and can send messages such as:

<pre class="lang:r decode:true">require(slackr)
slackr_setup()
slackr("This is an incoming piece of text from RStudio")</pre>

Which results in the following in my #r slack channel:

[<img class="aligncenter wp-image-1028 size-full" src="wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.41.41-PM.png" alt="Screen Shot 2016-07-08 at 1.41.41 PM" width="727" height="91" srcset="wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.41.41-PM.png 727w, wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.41.41-PM-300x38.png 300w" sizes="(max-width: 727px) 100vw, 727px" />](wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.41.41-PM.png)

There is also a provision for sending output graphics like ggplot objects.  Here is an example of heterozygosity in the Arapat data set.

<pre class="lang:r decode:true ">library(gstudio)
library(ggplot2)
data(arapat)
he <- genetic_diversity(arapat,mode="He")
p <- ggplot( he, aes(x=Locus, y=He)) + geom_bar(stat="identity") + theme_bw()
ggslack(p)
</pre>

Which directly uploads the image to the channel as:

[<img class="aligncenter wp-image-1029 size-full" src="wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.46.04-PM.png" alt="Screen Shot 2016-07-08 at 1.46.04 PM" width="380" height="422" srcset="wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.46.04-PM.png 380w, wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.46.04-PM-270x300.png 270w" sizes="(max-width: 380px) 100vw, 380px" />](wp-content/uploads/2016/07/Screen-Shot-2016-07-08-at-1.46.04-PM.png)

Very Cool!

* * *

There is a slight <span style="color: #ff0000">problem</span> though.  The current version of the slackr library has an error in it associated with (perhaps) a recent change in the Slack API that has not been fixed by the developer.

For me to get this to work, I had to compile the package myself after making the following change in one file.  To fix it, do the following:

  1. Download (or checkout) the repository from github at: <https://github.com/hrbrmstr/slackr>
  2. Open the project in RStudio
  3. Open the R file names <span class="lang:r decode:true crayon-inline ">slackr_utils.R</span>
  4. In the function named <span class="lang:r decode:true crayon-inline ">slackr_ims</span>  the last line (line 117) is something like <span class="lang:r decode:true crayon-inline">dplyr::left_join( %some stuff% )</span>
  5. Replace this line with <span class="lang:r decode:true crayon-inline ">suppressWarnings( merge(users, ims, by.x=&#8221;id&#8221;, by.y='user') )</span>
  6. The compile and install the package as: <pre class="lang:r decode:true ">require(devtools)
load_all()
build()
install()
</pre>

  7. It should work just fine.

Hopefully, on the next time that this package is updated by the author, the <span class="lang:r decode:true crayon-inline ">left_join()</span>  problem will have been resolved.  This issue had been marked as &#8220;resolved&#8221; in the github issues a while back but apparently not pushed to the repository.