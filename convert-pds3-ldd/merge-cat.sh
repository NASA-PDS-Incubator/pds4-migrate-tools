#!/bin/bash
# Merge all .CAT files in the current directory.
# Output is placed in the file name passed on the command line
# or in "MERGED.CAT" if no arguments are given

OUTCAT=${1:-MERGED.CAT}    

echo "PDS_VERSION_ID                   = PDS3" > $OUTCAT

for i in *.CAT; do
	echo file: $i
	grep -v -e "^PDS_VERSION_ID" -e "LABEL_REVISION_NOTE" -e "^END$" -e "^/\*" $i >> $OUTCAT
done

echo "END" >> $OUTCAT