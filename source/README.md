# Original Sources

The original sources are available for archiving purposes in the originals.zip
file.  They contain Suitcase bitmap and Postscript outline fonts in Mac specific
formats (Apple Double encoded Resource Forks).  They were extracted into
BDF bitmaps with AFM metrics as well as PFB outline fonts, present here.

# Creating TrueType, OpenType, DFont, and others

Use the convert.pe script present, e.g., to create TrueType fonts based on the
Postscript outlines, do:

```
$ ./convert.pe -f ".ttf" "*.pfb"
```
