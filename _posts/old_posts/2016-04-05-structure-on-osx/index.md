---
title: STRUCTURE on OSX
date: 2016-04-05T13:52:14+00:00
guid: http://dyerlab.bio.vcu.edu/?p=880
permalink: /2016/04/05/structure-on-osx/

categories:
  - Applied Population Genetics
  - Code
  - Population Genetics
  - Tutorials
---
The program STRUCTURE is an ubiquitous feature of many population genetic studies these days—if it is appropriate is another question. Today, while covering model based clustering in population genetics, we ran into a problem where STRUCTURE was unable to run and the OS said it was Corrupted and should be thrown away.  Jump below for our fix, it really is an easy one.

<!--more-->

The most recent version of the GUI STRUCTURE java package dates from 2012.  This is getting a bit long in the tooth, but when teaching it is not that far fetched to have aged laptops&#8230;

The error we were running into is the prompted with the following dialog box when attempting to start the program.

<img class="aligncenter wp-image-883 size-large" src="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.46.30-PM-1024x380.png" alt="Screen Shot 2016-04-05 at 2.46.30 PM" width="768" height="285" srcset="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.46.30-PM-1024x380.png 1024w, wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.46.30-PM-300x111.png 300w, wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.46.30-PM-768x285.png 768w, wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.46.30-PM.png 1370w" sizes="(max-width: 768px) 100vw, 768px" /> 

As it turns out, sometime between 2012 and now, OSX has moved towards digitally signing applications and in this case, it is not that it is &#8220;damaged&#8221; it just won't allow the Java Runtime to run it unless we make a small change in the preferences panel and select the Security & Privacy option.

<img class="aligncenter wp-image-884 size-thumbnail" src="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.48.22-PM-142x150.png" alt="Screen Shot 2016-04-05 at 2.48.22 PM" width="142" height="150" /> 

Then authenticate on the bottom by clicking on the lock and entering your password.

<img class="aligncenter size-medium wp-image-886" src="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.48.00-PM-300x74.png" alt="Screen Shot 2016-04-05 at 2.48.00 PM" width="300" height="74" srcset="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.48.00-PM-300x74.png 300w, wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.48.00-PM.png 478w" sizes="(max-width: 300px) 100vw, 300px" /> 

Now, change the setting on the Allow apps downloaded from to the Anywhere option.

<img class="aligncenter size-medium wp-image-885" src="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.49.36-PM-300x98.png" alt="Screen Shot 2016-04-05 at 2.49.36 PM" width="300" height="98" srcset="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.49.36-PM-300x98.png 300w, wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.49.36-PM.png 648w" sizes="(max-width: 300px) 100vw, 300px" /> 

This should allow you to start STRUCTURE and run it.  Do that and then close it.  Go back to the System Preferences and turn it back to what you had it before.

<img class="aligncenter size-medium wp-image-887" src="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.51.22-PM-300x101.png" alt="Screen Shot 2016-04-05 at 2.51.22 PM" width="300" height="101" srcset="wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.51.22-PM-300x101.png 300w, wp-content/uploads/2016/04/Screen-Shot-2016-04-05-at-2.51.22-PM.png 646w" sizes="(max-width: 300px) 100vw, 300px" /> 

Once you run it once, you will be able to run it again without lowering your security. Happy clustering!