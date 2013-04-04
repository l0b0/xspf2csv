xspf2csv
========

Convert [XML Shareable Playlist Format](http://xspf.org/) (XSPF) to comma-separated values (CSV) for import with services like [Ivy](http://ivyishere.org/).

It's really fast; around 25 milliseconds to process over 1200 tracks.

Use
---

    xsltproc xspf2csv.xsl /path/to/your/playlist.xspf > playlist.csv

Tests
-----

You'll need [shunit2](http://code.google.com/p/shunit2/) to run `test.sh`.
