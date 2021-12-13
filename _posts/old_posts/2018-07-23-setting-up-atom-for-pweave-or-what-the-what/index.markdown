---
author: rodney
date: 2018-07-23 20:48:06+00:00
draft: false
title: 'Setting up Atom for Pweave. Or: What the what?'
type: post
url: /2018/07/23/setting-up-atom-for-pweave-or-what-the-what/
categories:
- Dyerlab
- Software
- Technology
---
So as a way to expand some of the analytical tools we offer the students at my work, I'm developing a version of my Data Literacy course that will use Python as well as R. There is a lot of overlap in these two languages and both are of interest to our students as they develop their toolkits. This document walks through how to set up Pweave on your machine so you can engage in a little_Literate Programming_ (trust me, it will make your life suck a lot less. To see how to set up Atom, see my [previous post](https://rodneydyer.com/2018/06/20/the-atom-editor/).

## Literate Programming

<blockquote>I believe that the time is ripe for significantly better documentation of programs, and that we can best achieve this by considering programs to be works of literature. Hence, my title_Literate Programming._
> 
> Knuth - 1992</blockquote>

If you think of it a bit, as data scientists, the documents and manuscripts we work on every day are just extensions of programs and scripts we use to do our work. However, in academia we are taught the process in entirely the wrong sequence. Traditionally, we are taught the following sequence.

  1. We've are funneled by the primary interface for writing scientific documents--the word processor--into that monstrous chunk of software we use to crafted our tales about the data we were presenting. How many times have we started working on a new project and the first thing we do is fire up a editor and start an outline of a manuscript? We never really liked it but this was the main tool we were taught to use (and the crappy reference managers tacked onto them).  2. In a separate interface, we would perform our analyses. In my career, I've used:    * That VAX machine over in the Math Department at UMSL. It ran SAS and I did most of my work in IML.    * One-off software packages that worked on our 'special' kind of data we are working with. These were typically FORTRAN code written by some wizard at a far-off university. Anyone remember [BioSYS from Swofford & Selander](http://doi.org/10.1093/oxfordjournals.jhered.a109497)?    * Workarounds in C (my own popgraph software is written in C).    * Extensions that could be shoved into Excel (GenAlEx is a good example of how far you can push VB).    * Scripting languages such as [R](http://cran.r-project.org), [Perl](http://www.perl.org) (no one uses this one any longer, which is probably a good thing), [Python](http://www.python.org), [Julia](https://julialang.org/), etc.  3. Then we would export the raw output to some kind of plotting software to make your graphics. I always hated this step, because inevitably, we'd have to come back and redo the graphics (higher DPI says the publisher) and we'd have to remember how we made it that last time as most of these interfaces are stupid point-and-click software packages.

The main problem is that any iteration of the manuscript would require manually going through the process or changing the text document, rerunning the analysis, then replotting the figures. Move this section up her and then go back through and make sure all your figure and table references are recovered.

But this is entirely upside-down! Instead of Communicate -> Analysis -> Visualize, our workflow should be more like:

![](/img/2018/07/DataWorkCycle.png)
Data science workflow

We should be data-focused, not manuscript focused!

<blockquote>The research manuscript is simply an advertisement of our research and the data, it IS NOT the research or data.
> 
> Dyer - Just now!</blockquote>

## PWeave

PWeave is like SWeave (and its better version Knitr) on R. It is a tool that we can use to interdigitate our analysis and how we go about presenting it all in one place. This allows us to have a single_document_ where we can have the data, the analyses, the output, and the verbiage that we use to describe what we are doing. This tight coupling of the data to the rest of the components helps in [Reproducible Research](https://reproducibleresearch.net/).

To install Pweave, you need to have atom and python already configured. Then in Atom, install the following packages

  * language-weave  * Hydrogen  * language-markdown  * platformio-ide-terminal

Next, you can prepare a short script. Here is a fragment of one.

![](/img/2018/07/2018-07-23_14-20-35-e1532370195594.png)
Raw pweave document.

What this does is mix in markdown text and code. If you have not used Markdown before, it is pretty straight forward. Here are some simple rules.

  * A line with one or more **#** marks are headings.  * A word or bit of text between asterisks (e.g., *this*) are italicized.  * A word or bit of text between pairs of asterisks (e.g., **this**) are bold.  * Links are placed in parentheses with the option to have specific word to be the link.  [link](http://foo.bar)  * Lists are done physically, new line with dash for unordered or new line with number as numeric.

All the python code must be within the bounds marked by the three backslashes. The code will be evaluated, from the top of the document to the bottom. You _do not_ have to show the code for it to run.

To weave the document into HTML (we can do other formats as well but this gets us going, open the terminal and type:
    
    <code class="">pweave.exe test1.pmd</code>

And it should produce a document in the same folder but as an *.html file.

![](/img/2018/07/2018-07-23_14-20-59.png)
Which is pretty cool. Now, there are a lot more things you can do with markdown.

