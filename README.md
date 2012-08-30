[metaSave](http://github.com/vosbergw/metaSave) is an example utility
using the [picasa3meta](http://vosbergw.github.com/picasa3meta/docs/index.html)
library to extract and save the metadata from a Picasa library.

Before running, make sure that PYTHONPATH includes the picasa3meta 
package.


```
$ PYTHONPATH=~/lib/picasa3meta
$ export PYTHONPATH
$ metaSave --help

usage: metaSave [-h] [--path PATH] --photos SOURCE [--dest DEST]
                [--tweak TWEAK]

Collect all the image metadata I can find into one place.

optional arguments:
  -h, --help       show this help message and exit
  --path PATH      Path to the Picasa database files. If left off, search
                   $HOME for directory Picasa3 containing directories db3 and
                   contacts
  --photos SOURCE  Path to the photo tree. This directory tree will be
                   duplicated at <dest>/<basename of tree>.meta and all meta
                   data from the pmp databases, .picasa.ini files and exif
                   info will be placed there. **NOTHING UNDER THIS DIRECTORY
                   WILL BE MODIFIED**
  --dest DEST      Where to create the metadata tree. Defaults to $CWD
  --tweak TWEAK    Adjust the path names used when searching thumbindex.db.
                   What is stored in thumbindex.db is the full path relative
                   to the system it was created on. If you have copied the
                   photo tree and Picasa3 files to another system or have them
                   remotely mounted with a different path you can use --tweak
                   to adjust the path. example: --tweak
                   '/my/path/Pictures':'/thumbindex/path/Pictures'

```
