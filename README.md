eac3toac3 bash script
=======================

This script needs:
* libav (avconv)
* mkvtoolnix (mkvinfo and mkvextract)

## Usage
```bash
./eac3toac3.sh mkvfilename.mkv
```

Will output:
* mkvfilename.eac3
* mkvfilename.ac3

Then, you can merge into a MKV container with mkvmerge.
