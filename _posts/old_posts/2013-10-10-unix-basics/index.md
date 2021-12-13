---
title: Unix Basics
date: 2013-10-10T07:00:37+00:00
guid: http://rampages.us/dyerlab/?p=263
permalink: /2013/10/10/unix-basics/
categories:
  - Tutorials
tags:
  - servers
  - unix
---
This covers some basic unix commands so that you can log into a machine and move around in it with ease.  It is by no means comprehensive.

# Logging In

To log into a machine you must use SSH.  This is a secure shell and is encrypted on both ends so that others cannot snoop on your passwords or activities.   If you are a windows person (shudder), you will have to use a GUI application to log into the server.  Download one and install it.  The server we will be using in this exercise is:

###### chesapeake.envs.vcu.edu

and can also be referenced by the raw IP address as:

###### 128.172.178.27

Both of these addresses are the same.  You will need both a user name and password on the server before you can log into it.

If you are outside VCU network, you will have to log into our VPN (see vcu.edu and search for webvpn if you do not know how to do this).  On a mac/unix/linux box, you can use the terminal application to log into the server as:

###### ssh chesapeake.envs.vcu.edu

or with the raw IP address.  Note: if you have a user name that is different on your local machine than it is on the server, you need to specify that in the ssh call as:

###### ssh server\_user\_id@chesapeake.envs.vcu.edu

Once you log into the remote server you will be greeted with a prompt from which you will be able to interact with the computer directly (e.g., no need for gui-pointy-clicky stuff).

# Bash

When you are logged into the server, you are actually working in an interactive programming environment.  By default, the dyerlab servers run the Bash Shell.  This is a command line interface that has the ability to do quite a few things that reduce the amount of tedium in your computational life.  The entire philosophy of unix is to provide an environment where:

  1. There is a strict partition between the stuff that you do in your own account and the stuff others do.  Security at the OS level is priority number one and as such has a fairly strict set of requirements for what you as a user can see and do.  This is good.
  2. Things work well together.  Programs are small.  There is no monolithic program that tries to do everything (except emacs but that is a flamewar of a different type).  Programs do one type of task and do not try to multitask.  This is very good because we have evolved an ecosystem of programs that are very efficient.
  3. It is assumed that unix programs read and write text files, not binary files.  It goes against the philosophy of the OS for a program to sequester its data into formats that are unreachable by other programs.  If a program does this then it is no longer a citizen of the unix program community and as such has cut itself off from the breadth of opportunities that such an interaction entails.  This is a very very good thing because you as a user can build complicated workflows in the environment that achieve things that would take much longer in the normal clickity-clickity mouse world we typically inhabit.

# Basic Commands

To move around a unix box on a server you are not in front of, you must do it from the command line.  You will always be logged into your ‘home’ account.  This is literally at the location in the file system /home/your\_user\_name. Everyone has their own home directory and you cannot see what is in other peoples home directories unless they do some rather severe hacks (violating #1 above).  However, there are places you can put stuff to share materials between users, it is just not within the home directory.  Here is an overview of some basic commands. You can always find out where you are by typing:

**** ****

<table>
  <tr>
    <td>
      <b>Program</b>
    </td>
    
    <td>
      <b>Description</b>
    </td>
  </tr>
  
  <tr>
    <td>
      pwd
    </td>
    
    <td>
      Prints out the current directory you are in.
    </td>
  </tr>
  
  <tr>
    <td>
      ls
    </td>
    
    <td>
      Lists the files and folders in that directory (see ls -l for a long listing)
    </td>
  </tr>
  
  <tr>
    <td>
      cd
    </td>
    
    <td>
      Change to your home directory
    </td>
  </tr>
  
  <tr>
    <td>
      cd ..
    </td>
    
    <td>
      Changes to directory that is the immediate parent of the current one
    </td>
  </tr>
  
  <tr>
    <td>
      cd folder
    </td>
    
    <td>
      Changes the directory to ‘folder’
    </td>
  </tr>
  
  <tr>
    <td>
      exit
    </td>
    
    <td>
      Logs you out of the computer
    </td>
  </tr>
  
  <tr>
    <td>
      chmod
    </td>
    
    <td>
      Changes the permission/privileges for files.
    </td>
  </tr>
  
  <tr>
    <td>
      echo
    </td>
    
    <td>
      Prints out variables/content to the shell output
    </td>
  </tr>
  
  <tr>
    <td>
      cat
    </td>
    
    <td>
      Concatenates text to the terminal output
    </td>
  </tr>
  
  <tr>
    <td>
      head
    </td>
    
    <td>
      Prints out the top lines of a file
    </td>
  </tr>
  
  <tr>
    <td>
      wc
    </td>
    
    <td>
      Counts words (default) or lines (-l) in a file
    </td>
  </tr>
  
  <tr>
    <td>
      grep
    </td>
    
    <td>
      Gets a regular expression (e.g., used for text searching)
    </td>
  </tr>
</table>

Almost all programs (pwd, ls, cd, etc.) have a manual associated with them.  This is because there are often many options to modify the behavior of the output.  You can get to the manual for any program by:

###### man prog

All manual entries have the same format and go through all the options available.

# Editing Files

There is a plethora of editors available to the unix user.  Perhaps the easiest one on the servers you’ll be using is nano.  This is a simple editor that allows you to open, change, and save text files.  Given that this is a command-line environment, the menu-like options are available via keyboard combinations indicated at the bottom of the screen.  In most unix environments the symbol ‘^’ denotes the control key (e.g., ^-Q would be holding down the control key and typing Q), and ‘M’ denotes the key labelled ‘alt’ (the modifier key).  In nano these combinations act as the menu functionality.

To start an editing session type:

###### nano

and it will make a new file.  If you have an existing file, you can edit it as:

###### nano myfile.fasta

for example and it will open it up and start you on an editing session.

# Putting and Getting Files

To move documents from your computer to a remote server, we use the SSH Copy command ‘scp’.  This is built into the ssh software itself.

###### scp file remoteserver:~/

The last part, ‘:~/’ is required as it tells scp that the remoteserver is a server and you want the file to go into your home directory ‘~/’

###### scp myremoteserver:~/thefile .

This will pull a file from the remote server to your current directory.  Again notice that the period is there, a period in the options to a program specifically means ‘this place in the directory heirarchy.’

If you are using windows, there is a GUI drag and drop interface with your SSH client.

# Running a Command Line Program

On a server all programs are run from the command line.  You have already seen that you can run a program by typing its name and hitting return.  The only reason this works is because there are executable binary files located in specific directories on the machine.  These directories are all called ‘bin’ and they are located in parts of the folder heirarchy dictating who can access them.  If you type at the command prompt:

###### echo $PATH

it will return all the bin files that you are, by default, able to search for programs.  The program echo prints out the value of a variable and all Bash Shell variables are indicated by a dollar sign (and by convention are typed in all upcase).

If a program is not in a ‘bin’ folder you access it will not run when you simply type its name.  What you have to do is to tell the Bash Shell the location of the program specifically, even if it is in the same directory as you are.

There is one more requirement to execute a program.  The program must be labelled as something that can be executed!  In unix, scripts such as Bash Scripts, perl, python, lua, and many other languages can be used to make programs but these programs are just text files containing the instructions necessary to perform a task.  To designate a program as a specific one that can be executed (if its contents actually can do something) you need to set the executable bit on the file by changing the mode of the file.  This is done using chmod and telling it to add executable privileges.

###### chmod +x program_file

Many things have executable privileges, try a ls -l and look at the far left column to see the privileges, the last digit is either x or &#8211; indicating executable status or not (n.b., folders are executable, if you turn it off you will not be able to change directory into that folder).

# Redirecting Output

As mentioned above, programs are small and do specialized things but can work together in ways that are quite dynamic.  This is done by redirecting output.  Here are some examples.  In the directory /usr/share/velvet\_1.2.10/data, there are several example fasta files that come with velvet.  Copy the test\_reference.fa file to your directory as:

###### cp /usr/share/velvet\_1.2.10/data/test\_reads.fa .

You should be able to see this file in your directory (via ls).  Lets count how many lines are in that file.  I see the following output (yours will be a bit different because you are not in my home directory (all the stuff to the left of the $ is not typed and is part of the bash prompt).

###### rodney@chesapeake ~ $ wc -l test_reads.fa

###### 285716 test_reads.fa

So this file has 285,716 lines in it.  Lets now look at the first few lines:

###### >SEQUENCE\_0\_length_35

###### GGATATAGGGCCAACCCAACTCAACGGCCTGTCTT

###### >SEQUENCE\_1\_length_35

###### CGACGAATGACAGGTCACGAATTTGGCGGGGATTA

###### >SEQUENCE\_2\_length_35

###### CCAAATAGGTCCTTACATCATGAGACGGGCCAAAT

###### >SEQUENCE\_3\_length_35

###### CGAGATGTATACCTCTAACACTGTGTTCCAAGTAC

###### >SEQUENCE\_4\_length_35

###### AAGCTCCCGCAATGGATCTTGTGACGGGCTGCTCG

This output is dumped to the terminal.  To redirect this output to another place, say a file, we use the redirect operator ‘>’ otherwise known as the greater than sign.

###### rodney@chesapeake ~ $ head test_reads.fa > firstfew.fa

###### rodney@chesapeake ~ $ wc -l firstfew.fa

###### 10 firstfew.fa

# Piping Between Programs

Hooking together programs is the next step and it is called piping.  It is accomplished by hooking together the output of one program with the input of another using the pipe character ‘|’ (the vertical line on the slash key on US english keyboards).  Lets say I wanted to search for a particular sequence in the test_reads.fa file. I’ll use GATACA because it was a good movie.  I use the grep command to find it by passing first what I am looking for and then the file I am looking for it in.  I will then pipe this through the wc  program to see how many lines have that sequence of nucleotides within it.

###### rodney@chesapeake ~ $ grep GATACA test_reads.fa  | wc -l

###### 790

So there are almost 800 reads with that sequence in it.  We can continue to combine commands together beyond just these two.  See if you can figure out what these commands do:

###### rodney@chesapeake ~ $ cat test_reads.fa | sort | head -100 > sortedfirstfew.fa

###### rodney@chesapeake ~ $ head sortedfirstfew.fa

###### AAAAAAAACGGGCTTATAGACCATGCAGGCTTCAT

###### AAAAAAACACTATACAGCCAGAGTTCCTTCTTCTT

###### AAAAAAACCCTTCTGTGTTTGATCTACCTACTATA

###### AAAAAAACGGGCTTATAGACCATGCAGGCTTCATG

###### AAAAAAACGTAAGGAGCGTTTATGCCAAACGAAGA

###### AAAAAAAGGCTCGTGACTGTCATCATCGAGACGCC

###### AAAAAAAGTGGGGTTCAAACACTCTATCCATGAAG

###### AAAAAAATTGACTGTTAATGGCAATTTCAAGTTAT

###### AAAAAACAGCGAACCAGATCTTATTTTGCTTCTAC

###### AAAAAACATGACAACGAGAGCAACCCGGGCATTTG

# Screen

OK, so when working on long-running programs, there is the need to be able to log in and out of a session without the various things you have running stopping each time.  When you log into a unix machine, you start a ‘session’ and you can log in many times using the same user ID.  When you log out, every process (running program) is purged from the memory and thus lost.  So unless you plan on being logged into a terminal until a long running process is done running (some may take months), a better solution is needed.  This is where a program called ‘screen’ comes in handy.

Screen is a program that is run after you log into the server.  What this does is to then make a ‘virtual session’ (or many of them) that you can attach and detach your terminal session to.  You start screen by typing:

###### screen

and then a read the verbage and continue (via space bar or hitting return). After that it will look like your normal terminal session and you’ll be able to do whatever you want to do just like before.  Screen is running in the background

So lets say you start a long running process like:

###### ./VelvetOptimiser.pl -s 16 -e 31 -f &#8220;-short -raw ~/data/pedima/pedimaSNPs.fasta&#8221;

This can take a while to run.  Now that you are already within a screen session, you can run it and then detach your terminal from that screen session. After you detach, the program will continue running just as before and you can re-attach at a later time to check on progress.

Here are the commands for listing, attaching, and detaching from screen sessions (n.b., they all start with CTRL+a followed by another letter.

<table>
  <tr>
    <td>
      Keys
    </td>
    
    <td>
      Description
    </td>
  </tr>
  
  <tr>
    <td>
      CTRL+a c
    </td>
    
    <td>
      Creates a new shell window
    </td>
  </tr>
  
  <tr>
    <td>
      CTRL+a k
    </td>
    
    <td>
      Kills the current window
    </td>
  </tr>
  
  <tr>
    <td>
      CTRL+a w
    </td>
    
    <td>
      Lists all windows (the current session is marked with an ‘*’)
    </td>
  </tr>
  
  <tr>
    <td>
      CTRL+a d
    </td>
    
    <td>
      Detach from current session
    </td>
  </tr>
  
  <tr>
    <td>
      CTRL+a D
    </td>
    
    <td>
      Detach from current session and close the shell as well
    </td>
  </tr>
  
  <tr>
    <td>
      CTRL+a 0-9
    </td>
    
    <td>
      Go to session 0, 1, … 9
    </td>
  </tr>
</table>

After you detach (CTRL+a d) you can exit the server and when you come back, you can reattach as:

###### screen -r

if you only have one screen session going, otherwise you can just start screen, list the open sessions, and then come back at that time.

# Velvet

Link to UMissouri

<http://umbc.rnet.missouri.edu/resources/How2RunVELVETonClark.html>

From NCBI: A basic protocol

<http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2952100/>