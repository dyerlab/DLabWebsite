---
author: rodney
date: 2019-01-30 19:15:29+00:00
draft: false
title: Digital Portfolios
type: post
url: /2019/01/30/digital-portfolios/
categories:
- envs643
- WP
---
One of the key benefits of adopting a WordPress (hereafter WP) site for your own content is to develop your digital portfolio.  This is an online location that contains information and other content relevant to your professional self.  In Environmental Studies, this content may include:

  * _Curriculum vitae_ or _Resume:_ The full record of your academic progress.  * _Manuscripts:_ Connection to or at least iteration through research manuscripts you contributed to.  * _Data:_ A single locale for data sets that you may provide to the public.  * Code & Analyses:  Examples and HOWTO's for some of the kinds of analyses you do in your own research and classes can be easily cataloged as posts and found though the robust search functionality present in the WordPress engine.  * _Class Projects & Output:_ You can either embed or link to specific projects and output you produced (or helped to produce) as part of classes you participated in.

Essentially, this can be used a an enhanced set of documents covering the totality of your learning experience.  At some point in the future, you will be looking to get a job or go to graduate school or whatever.  Having specific examples of GIS products, sophisticated statistical analyses, policy papers you wrote for class, or other examples of your work are much better at demonstrating your abilities than just a resume or CV.

At a high level, the layout of the site may be something like the diagram below, consisting of static pages, embedded documents, and collections of posts grouped by content type.

![](/img/2019/01/Screen-Shot-2019-01-30-at-1.29.21-PM.png)
One potential layout for a digital portfolio in Environmental Studies mixing both static pages (e.g., the resume) and collections of posts and external links (e.g., Field Work, GIS, and Policy papers).

In this example, it is rather easy for someone to get a pretty good idea of the breadth in skills, knowledge, and experiences you gained during your degree.

### Examples from Elsewhere

There are a lot of great examples of people using WP as a portfolio.  Here are some that I just found on the Google machine.

  * Here is a [PDF](http://michaelseery.com/home/wp-content/uploads/2012/01/Wordpress-for-E-Portfolios.pdf) from Michael Seery from the Dublin Institute of Technology giving a general overview of the structure of a digital portfolio.  * A post from [Successful Teaching](https://successfulteaching.wordpress.com/2012/10/31/use-wordpress-com-to-create-a-teaching-portfolio/) on creating teaching portfolios.  * [Loyola University ePortfolio](http://researchguides.loyno.edu/ePortfolio) page.  * [Journalism Education Association (JEA).](http://jea.org/wp/home/awards-honors/journalist-of-the-year/setting-up-a-wordpress-online-portfolio/)

## Suggestions for Components

I'm a big fan of Google Docs, so some of the following materials will be made in reference to you keeping materials on your Google Drive and either linking or embedding them here.  The main benefit of this approach is that you have a single repository, in the cloud, of all your documents, data, presentations, and other stuff.  If you lose your laptop, the hard drive crashes, or whatever, you always have access to your stuff.  At VCU, you are essentially given an unlimited amount of storage for your Google Drive.  

Having all your stuff in one place is a great start towards supporting reproducibility in your research.  If you craft and keep your CV as a google doc, you can share it via links or embed it within WP pages.  When you need to add that new citation you just published or advancement you just achieved to your CV, you update the Google Doc and these changes are automatically percolated throughout the rest of your sites and all the links you posted to it all over the internet.  What you are doing is creating a _singleton_ entity and pointing at it from all over so that all changes you make on this one item are reflected everywhere without you having to do anything.  There is a great post (if I do say so myself) about how to embed various Google Drive components [here](https://rodneydyer.com/2019/01/30/google-drive-content/).

### CV/Resume

Make this as a document in Google Docs.  Then publish it to the web for viewing by anyone with a link.  You can include other professional metrics and associations in the same location as the link to your CV.   Here is an example from my research laboratory webpage giving an image of my mug, contact email, and then various online digital designators (Google Scholar Profile, OrcID, Research Gate, etc.) and a link to my CV.

![](/img/2019/01/Screen-Shot-2019-01-30-at-1.46.53-PM.png)
On that particular page, I have links for each researcher in the lab with similar information.

### Course Related Materials

If your course uses WP for collaborations, you can make some or all of the materials you turned in public as well.  If you have not done this before, it is a pretty neat setup for classes.  For example, let's say that you are in my stats course ([ENVS543](https://rampages.us/envs543/)). This class requires you to produce, at the end of the semester, a short informational video about some kind of environmental data combining in some form  the culmination of your stats knowledge, video making and editing skills, green screening, and making custom and dynamic graphics.  To turn it in, you can create a post on your WP blog and put in verbiage and embed a YouTube copy of the resulting video.  Along with it, you may also include specifics about how you made the video, etc.  Now the class uses syndication between your and the class WP site.  When you post that entry, you give it a specific Category (say _envs543_), and the class WP site notices that you've published something that you want to syndicate with the class site and behind the scenes it 'sucks' up the blog entry and puts it on the class site without any interaction on our part.  You still own the content, it is yours, but it is displayed on the class site where others can see, interact, and comment on it.  

As you go through your educational program, you may accumulate an example project or paper or product from a whole host of classes, each of which you can link to from your Resume as evidence of the kind and caliber of work you produced.  You can group them into themes (as in the image above with GIS stuff together and Field-related stuff together, etc.) or use Tags and Categories to keep them organized.

### External Links

Sometimes it is very helpful to keep lists of things that you may need later.  For example, in a class I helped coordinate several years ago, we developed a list of online locations with geospatial data repositories.  I keep this list on my laboratory webpage ([here](https://dyerlab.ces.vcu.edu/2016/10/06/spatial-data-sources/)) and can add to it when I run across new source repositories.

### HowTo's and Snippets

In a lot of our classes we learn how to leverage complex tools to provide us the answers to our research questions.  For myself, I like to keep a record of some of the more complicated things so that in the future if I need to retrieve them, they are easily found.  Using a Category or Tag system to designate a page as relevant to some topic makes it really easy to find things later.  Here are some examples in R where I wanted to give an example of how to do something, each of which is entered as a POST with a Category of 'R'.

  * [Create a convex hull from points](https://dyerlab.ces.vcu.edu/2016/03/18/buffers-convex-hulls/).  * [Loading in Raster Data](https://dyerlab.ces.vcu.edu/2015/08/26/loading-in-rasters/).  * [How to install my gstudio package](https://dyerlab.ces.vcu.edu/2015/01/16/gstudio/).

Since all of these things, and all the content in each, is searchable in WP, it makes it really easy to use this as a repository for all kinds of information.

## Danger

As a final thought, remember that this is a digital representation of your professional development.  While you can password protect sections and even individual pages, this is not your personal brain dump.  Keep materials that are relevant to your professional digital portfolio on here and put the personal stuff elsewhere (maybe on your own WP blog...).

