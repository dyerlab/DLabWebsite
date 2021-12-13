---
title: 'Google Drive &#038; Git'
date: 2016-06-22T14:12:40+00:00
guid: http://dyerlab.bio.vcu.edu/?p=1015
permalink: /2016/06/22/google-drive-git/

categories:
  - Uncategorized
---
I was experiencing a bit of a problem with some conflicting files on google drive and a github repository.  I mirror my google drive as my Documents folder and on occassion, I am logged into more than one machine at a time and if you work on the same files without saving, they result in a conflict.  I notice this when I got the message.

<pre class="lang:sh decode:true">Office-iMac:gstudio rodney$ git pull
fatal: Reference has invalid format: 'refs/heads/master[Conflict 1]'</pre>

<!--more-->

And then when I looked into my .git folder, I saw

<pre class="lang:sh decode:true ">Office-iMac:gstudio rodney$ cd .git
Office-iMac:.git rodney$ ls
COMMIT_EDITMSG index
COMMIT_EDITMSG[Conflict 1] index[Conflict 1]
COMMIT_EDITMSG[Conflict] index[Conflict 2]
FETCH_HEAD index[Conflict 3]
FETCH_HEAD[Conflict 1] index[Conflict 4]
FETCH_HEAD[Conflict] index[Conflict 5]
HEAD index[Conflict]
ORIG_HEAD info
ORIG_HEAD[Conflict] logs
branches objects
config packed-refs
description refs
hooks

</pre>

<span style="line-height: 1.5">Apparently, git does not like square brackets and such in the names.  </span>To fix this, you need to do the following.

<pre class="lang:sh decode:true">find .git -type f -name "*Conflict*" -exec rm -f {} \;</pre>

And then clean up the packed references as:

<pre class="lang:sh decode:true ">awk '!/conflicted/' .git/packed-refs &gt; temp && mv temp .git/packed-refs</pre>

&nbsp;