---
title: Setting up PostGIS on GCP
author: rodney
date: '2020-03-19'
categories:
  - Programming
  - GCP
  - Database
  - PostGIS
tags:
  - code
  - postgresql
  - postgis
  - experimental
subtitle: 'Working towards online geospatial solutions'
image:
  placement: 1
  caption: "Google Cloud Platform"
  focal_point: "Left"
  preview_only: false
---

OK, so here we are, in the midst of COVID-19.  What a great time to start a new project and learn a new skill.  I'm focusing on developing a bit of my [golang](https://golang.org) chops and the [Google Cloud Platform](https://cloud.google.com) knowledge to see if we can use these as our primary backends for teaching and research needs at work.  My boss just gutted my server room and has maneuvered the only person who can actually do geospatial backend work to not work in my unit any longer so I've got to get creative.

This is an ongoing process, check out all the stuff related to this topic posted here under the [GCP](/categories/gcp/) category.


## Setting up `gcloud`

First we need to download the Google Cloud Platform SDK.  It can be found [here](https://cloud.google.com/sdk).  Download it and install it locally.  This will provide you with the `gcloud` command line interface.  

Here is the one I installed

```
rodney@mini ~ % gcloud version
Google Cloud SDK 285.0.1
bq 2.0.55
core 2020.03.17
gsutil 4.48
```

## Starting a Project

For this, you need to log into the Google Cloud [Console](https://console.google.com) and start a new project.  You will also be required to enter a credit card so that any charges you incur are taken care of.  For developers and all other people, Google gives $300 in monthly credit, which I have found to be more than enough for me to do everything I need to do to play around.  I have yet to be hit with any charges (and you can put on hard limits to be safe).

Once you have set up a project you can install a database.

## Installing PostgreSQL as CloudSQL

There are serveal ways to install databases, you could spin up a Virtual Machine (VM) running some flavor of linux (I like [Ubuntu](https://ubuntu.org) myself) or you can do this *serverless* (which is what I'm going to do here).  To run serverless, you do not need to worry about the underlying infrastructure of what is going on, just *trust* that Google can make a copy of PostgreSQL available to me.

To get an instance going, select *SQL* from the hamburger menu on the left and follow the documentation on spinning up an instance.  I'm using PostgreSQL because we can install PostGIS onto it, both MySQL and some Microsoft offering is also available if that is how you swing (no idea if the M$ can have geospatial data extensions).

Notes:  
 
 - Give the instance a reasonable name, you'll be using it over and over.
 - Make a good password and *save* it.


### Making an SSL Certificate - `Failed`

To be able to connect to this instance, we need to get an SSL Certificate.  In the *Connections* tab do the following:

1. Set the database to be only allowing connections via SSL.  
1. Configure a new client certificate and download the client-key.pem, client-cert.pem and server-ca.pem.  These three files are needed to connect `psql` to this server.
1. Copy and save the connection information that is presented for you.

```
psql "sslmode=verify-ca sslrootcert=server-ca.pem \
      sslcert=client-cert.pem sslkey=client-key.pem \
      hostaddr=X.X.X.X \
      port=5432 \
      user=postgres dbname=postgres"
```

This should be what you need.  Run it from the same folder you downloaded the *.pem files and you should be good.  For more information, see the connection documents [here](https://cloud.google.com/sql/docs/postgres/connect-admin-ip)

I was rather unable to get this to work, so I tried another way to actually get it to work.  Would like to get the IP way as this may scale a bit better than using Proxies...

### CloudSQL Proxy

This is another way of trying to connect to your instance online and simplifies stuff by hadling all the authentication stuff.  You can see the documentation for this [here](https://cloud.google.com/sql/docs/mysql/sql-proxy).  
























