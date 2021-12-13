---
author: rodney
date: 2019-07-30 23:22:29+00:00
draft: false
title: Starting Golang Development
type: post
url: /2019/07/30/starting-golang-development/
categories:
- Programming
tags:
- Go
---

OK, so I play around a lot with languages like Swift, Go, and R. These are all great languages—except R which is crap but those damn engineers at RStudio make it just so damn convenient—and have some really great extension of the previous languages we’ve used in the past.

Recently, I’ve been given the _opportunity_ to serve as the Director of the VCU Center for High Performance Computing (think 10’s of thousands of processors in a building-level climate controlled chamber). Very cool and very geeky.

So, I think this is a great opportunity for me to spread out and try to develop some new skills. Skills focusing on concurent programming and on how to seamlessly scale to hundreds or thousands of servers if necessary.

Enter Go.

![img-alternative-text](/img/2019/07/1564528641.png)
This is a language that was developed by Google for their own use in the cloud. They scale to immense sizes. Moreover, it was created by three of the most prolific and insightful engineers:

 	  * Robert Griesemer,
 	  * Rob Pike, and
 	  * Ken Thompson

These are some pretty high-level thinkers that have decided that the language should have as few features as necessary. In fact, as I understand it, they decided that each feature added to the language **must** be agreed upon unanimously by the development group. As a result, this is a trim statically typed, compiled programming language, somewhat similar to C but with memory safety, garbage collection, structural typing, and a CSP-style concurrency. Sounds good to me!

Here is a presentation of the history of languages and what led to the formation of Go!

https://youtu.be/sX8r6zATHGU
