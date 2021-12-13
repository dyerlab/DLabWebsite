---
author: rodney
date: 2019-01-30 13:15:38+00:00
draft: false
title: Google Drive Content
type: post
url: /2019/01/30/google-drive-content/
categories:
- Academics
- ENVS
- WP
---
Google Drive is a great tool for collaboration and reproducible research.  It is also works well with WordPress allowing you to embed various content, and since it is linked to a document, spreadsheet, or presentation on Google Drive, it will be updated automatically on your WP site when you make changes.  Here I show a few approaches to embedding content from your Drive in WP.

## Links

Anything on your Google Drive can be linked via a URL.  Right click on the item and select "Get Sharable Link"

![](/img/2019/01/Screen-Shot-2019-01-30-at-7.58.01-AM-905x1024.png)
Insert the resulting link where you need it.

### PDF's

Embedding a PDF is a bit more convoluted (for reasons I do not understand).  On Google Drive, select the PDF to show it in the browser.  In the upper right corner, there is a menu (the three dots in the image below).  Select "Open in New Window"

![](/img/2019/01/Screen-Shot-2019-01-30-at-8.01.56-AM-1024x556.png)
This will open it in a new window (duh). 

Then do the same thing but this time, there is a different entry named "Embed Item"

![](/img/2019/01/Screen-Shot-2019-01-30-at-8.03.14-AM-1024x540.png)
This will provide a pop-up window with some HTML code for you to put into your page.

![](/img/2019/01/Screen-Shot-2019-01-30-at-8.04.35-AM-1024x456.png)
Insert this code into your page as HTML.

The resulting content looks like this, embedded in your page with the ability to 'pop out' the PDF into its own browser for your readers.  

## Embed Google Docs/Sheets/Slides

The last part embeds the document itself into the page.  This is very helpful for presentations, you can embed your talk on your own webpage using Google Slides and then 'present' it where and whenever you need to.

It is pretty easy too.  Open the document and select _File->PublishtotheWeb_

![](/img/2019/01/Screen-Shot-2019-01-30-at-8.08.19-AM-466x1024.png)
This will provide the following dialog

Select "Link" for a link to the presentation or "Embed" to make it a part of the page itself.  If you are embedding it, it will provide you some HTML code, just like that above for PDF to insert into your page.

![](/img/2019/01/Screen-Shot-2019-01-30-at-8.12.43-AM-910x1024.png)
Which when inserted as HTML, looks like:

The cool thing here is that you have all the 'remote presentation' controls available for you to use to present directly from the browser.

## Conclusion

I hope this helps out in using Google Drive elements within your Wordpress Site.  It is a powerful combination of tools that allow you to disseminate information in a more timely and up-to-date fashion.

