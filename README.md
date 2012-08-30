metaSave is an example utility using the 
[picasa3meta](http://vosbergw.github.com/picasa3meta/docs/index.html)
package to extract and save the metadata from a Picasa library.  It will
walk a photo tree (specified by --photos) and create a duplicate tree
(either in the current working directory or a directory specified by
--dest) and for each image found in the original photo tree create a new 
file with a .meta extension in the destination tree containing the
pmp, ini and exiv2 metadata.  

For example, if the input tree is:

```
	~/Pictures/
		Album1/
			image001.jpg
			image002.jpg
```

The output tree would be:

```			
	
	$DEST/Pictures.meta/
		Album1/
			image001.jpg.meta
			image002.jpg.meta

```

A sample output file might look like:

```
		pmp.index:21431
		pmp.caption:Christmas 1978
		...
		pmp.filters:autolight=1;autocolor=1;crop64=1,8c20842f6d7fed1;enhance=1;fill=1,0.289720;
		pmp.filters.autolight:1
		pmp.filters.autocolor:1
		pmp.filters.crop64:1,8c20842f6d7fed1
		pmp.filters.enhance:1
		pmp.filters.fill:1,0.289720
		...
		ini.crop=rect64(8c20842f6d7fed1)
		ini.cropxy=0.034211,0.032258,0.964233,0.995392
		...
		ini.faces=rect64(7b36048cad223d28),7a162eb10f6470eb;rect64(502f02655e191250),ffffffffffffffff;rect64(c0491903e3033e98),3f1c39c6f473ee87
		ini.sfaces="First Contact1","unknown","First Contact2"
		ini.backuphash=5473
		ini.filters=redeye=1;
		Exif.Image.Software:Picasa
		Exif.Image.ExifTag:46
		Exif.Photo.ExifVersion:2.20
		Exif.Photo.DateTimeOriginal:1978:12:25 07:58:04
		Iptc.Envelope.ModelVersion:4
		Iptc.Envelope.CharacterSet:
		Iptc.Application2.RecordVersion:4
		Iptc.Application2.DateCreated:1978-12-25
		Iptc.Application2.TimeCreated:07:58:04+00:00
		Iptc.Application2.Caption:Christmas 1978
		Xmp.exif.DateTimeOriginal:1978-12-25T07:58:04+00:00
		Xmp.dc.description:Christmas 1978

```

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
