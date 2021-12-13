---
title: MacOS Monterey (beta)
author: R package build
date: '2021-06-09'
slug: macos-monterey
categories:
  - Apple
tags: []
subtitle: 'The next round of operating systems'
summary: 'Apple has released the developers version of all its operating systems to be released in the fall.  Here is a quick dive into one of them—MacOS Monterey.'
authors: []
lastmod: '2021-06-09T09:59:43-04:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

So yesterday, Apple introduced the next set of operating systems for iOS, MacOS, tvOS, iPadOS, and tvOS as well as a bunch of interesting upgrades for all the new hardware.  I took the plunge with installing it on my M1 Macbook and here are some thoughts on items as I see them evolve.

## Overall 

Overall, most things work out of the box with no problems.

- R, RStudio (minus git as described below)
- Mail - I wish they would add "send later" but works great and has more privacy functions.


## Safari

It is still REALLY FAST and new layout for the tabs.

![Safari with tabs and address bar integrated](https://live.staticflickr.com/65535/51237064300_1d63a04eee_c_d.jpg)



## Development Tools


The first thing I did after install it was to install the latest version of [XCode](https://developer.apple.com/xcode/), 13 beta.  It is a very large installation and I installed the optional development tools.

However, in `RStudio`, there was no `git` tab, so I knew there was a problem.


![](https://live.staticflickr.com/65535/51235905876_d74076b57e_c_d.jpg)


In the terminal, I verified there was an issue by trying to get the status of the same project folder.

```bash
rodney@Rodneys-M1 landscape-genetics-workshop % git status
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
```

To fix it, I had to install some additional tools from the command line.

```bash
rodney@Rodneys-M1 landscape-genetics-workshop % xcode-select --install
xcode-select: note: install requested for command line developer tools
```

Now it all works perfectly.




