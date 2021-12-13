---
title: Capturing contents within Curly Brackets
date: 2017-10-05T09:16:48+00:00
guid: https://dyerlab.ces.vcu.edu/?p=1158
permalink: /2017/10/05/capturing-contents-within-curly-brackets/
categories:
  - Code
  - Publications
  - Research
---
OK, just a quickie here. I'm working with a colleague on a manuscript using LaTeX.  The citation formatting for the journal we are looking at uses the numerical citations but bibtex will number the citations by the order in which the <span class="lang:sh decode:true  crayon-inline ">\bibitem</span>  values they occur in the bibliography section.  So, it would be great to get them to be in the order in which they occur in the text.

So, our old friend (and sometimes enemy) grep comes to the rescue.  Here is a quick one-liner that allows you to search the text for all the <span class="lang:sh decode:true  crayon-inline ">\cite{}</span>  entries and return only the contents within the curly brackets.

<pre class="lang:sh decode:true ">cat test.tex | grep -o -e "cite{[^}]*}"</pre>

Once all the editing is done and we've finished on the main body of the text, we can reorder the bibliography section and the numbers will be incremental.

Sometimes I forget how awesome and powerful the unix underpinnings are.