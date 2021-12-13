---
title: Install rgeos on OSX
date: 2015-03-31T13:49:39+00:00
guid: http://dyerlab.bio.vcu.edu/?p=412
permalink: /2015/03/31/install-rgeos-on-osx/

categories:
  - Code
  - Tutorials
---
There seems to be some nefarious conspiracy against packaging spatial R packages on the mac platform. Don't quite understand it but it sucks.  Here is how to install the rgeos package.

If you try the normal way, you get the following error:

<pre class="lang:default decode:true">install.packages("rgeos")
package ‘rgeos’ is available as a source package but not as a binary
Warning in install.packages : package ‘rgeos’ is not available (as a binary package for R version 3.1.3)</pre>

which is not very helpful.  <!--more-->So here is a quick way to do that I use when I need to upgrade it or put it on a new machine.

  1. If you do not have the developers tools from Apple, download them and install through the normal AppStore mechanisms.  You will need to compile stuff from raw code for this to work.
  2. Download and install the GDAL Complete package from [KyngChaos](http://www.kyngchaos.com/software:frameworks ).  At the time of writing, it was version 1.11 (39.0 MB).  If you are using Mavericks or later, you'll have to probably change your security settings (System Preferences -> Security -> General) to &#8220;Allow apps downloaded from &#8216;anywhere' to be installed. If everything works nicely (which I've never seen actually work), you should be able to do the following to install. Unfortunately, it always barfs on me. <pre class="lang:default decode:true">install.packages("rgeos", repos="http://R-Forge.R-project.org", type="source")
trying URL 'http://R-Forge.R-project.org/src/contrib/rgeos_0.3-9.tar.gz'
Content type 'application/x-gzip' length 238246 bytes (232 KB)
opened URL
==================================================
downloaded 232 KB

* installing *source* package ‘rgeos’ ...
configure: CC: clang
configure: CXX: clang++
configure: rgeos: 0.3-8
checking for /usr/bin/svnversion... yes
cat: inst/SVN_VERSION: No such file or directory
configure: svn revision: 
checking for geos-config... no
configure: error: geos-config not found or not executable.
ERROR: configuration failed for package ‘rgeos’
* removing ‘/Library/Frameworks/R.framework/Versions/3.1/Resources/library/rgeos’

The downloaded source packages are in
	‘/private/var/folders/06/jmbn_ny94rs1nw19xclvdzqc0000gn/T/Rtmp9VCkBI/downloaded_packages’
Warning message:
In install.packages("rgeos", repos = "http://R-Forge.R-project.org",  :
  installation of package ‘rgeos’ had non-zero exit status
</pre>

  3. This means that you need to actually compile the results.  Download the latest sources from [r-forge](https://r-forge.r-project.org/R/?group_id=602) (use the *.tar.gz version).  Open the terminal and: <pre class="lang:default decode:true">cd ~/Downloads
R CMD INSTALL
</pre>
    
    and you should see the following:
    
    <pre class="lang:default decode:true ">R CMD INSTALL rgeos_0.3-9.tar.gz --configure-args="--with-geos-config=/Library/Frameworks/GEOS.framework/unix/bin/geos-config"
* installing to library ‘/Library/Frameworks/R.framework/Versions/3.1/Resources/library’
* installing *source* package ‘rgeos’ ...
configure: CC: clang
configure: CXX: clang++
configure: rgeos: 0.3-8
checking for /usr/bin/svnversion... yes
cat: inst/SVN_VERSION: No such file or directory
configure: svn revision: 
configure: geos-config set to /Library/Frameworks/GEOS.framework/unix/bin/geos-config
checking geos-config exists... yes
checking geos-config executable... yes
checking geos-config usability... yes
configure: GEOS version: 3.4.2
checking geos version at least 3.2.0... yes
checking geos-config clibs... yes
checking for gcc... clang
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether clang accepts -g... yes
checking for clang option to accept ISO C89... none needed
checking how to run the C preprocessor... clang -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... rm: conftest.dSYM: is a directory
rm: conftest.dSYM: is a directory
yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking geos_c.h usability... yes
checking geos_c.h presence... yes
checking for geos_c.h... yes
checking geos: linking with libgeos_c... yes
configure: PKG_CPPFLAGS:  -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include
configure: PKG_LIBS:  -L/Library/Frameworks/GEOS.framework/Versions/3/unix/lib -lgeos -L/Library/Frameworks/GEOS.framework/Versions/3/unix/lib -lgeos_c
configure: creating ./config.status
config.status: creating src/Makevars
** libs
clang++ -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c dummy.cc -o dummy.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c init.c -o init.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c local_stubs.c -o local_stubs.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos.c -o rgeos.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_R2geos.c -o rgeos_R2geos.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_R2geosMP.c -o rgeos_R2geosMP.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_bbox.c -o rgeos_bbox.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_buffer.c -o rgeos_buffer.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_coord.c -o rgeos_coord.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_geos2R.c -o rgeos_geos2R.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_misc.c -o rgeos_misc.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_poly2nb.c -o rgeos_poly2nb.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_predicate_binary.c -o rgeos_predicate_binary.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_predicate_unary.c -o rgeos_predicate_unary.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_topology.c -o rgeos_topology.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_topology_binary.c -o rgeos_topology_binary.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_validate.c -o rgeos_validate.o
clang -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -I/Library/Frameworks/GEOS.framework/Versions/3/unix/include -I/usr/local/include -I/usr/local/include/freetype2 -I/opt/X11/include -I"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/sp/include"   -fPIC  -Wall -mtune=core2 -g -O2  -c rgeos_wkt.c -o rgeos_wkt.o
clang++ -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o rgeos.so dummy.o init.o local_stubs.o rgeos.o rgeos_R2geos.o rgeos_R2geosMP.o rgeos_bbox.o rgeos_buffer.o rgeos_coord.o rgeos_geos2R.o rgeos_misc.o rgeos_poly2nb.o rgeos_predicate_binary.o rgeos_predicate_unary.o rgeos_topology.o rgeos_topology_binary.o rgeos_validate.o rgeos_wkt.o -L/Library/Frameworks/GEOS.framework/Versions/3/unix/lib -lgeos -L/Library/Frameworks/GEOS.framework/Versions/3/unix/lib -lgeos_c -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Library/Frameworks/R.framework/Versions/3.1/Resources/library/rgeos/libs
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (rgeos)
</pre>

  4. And your done.