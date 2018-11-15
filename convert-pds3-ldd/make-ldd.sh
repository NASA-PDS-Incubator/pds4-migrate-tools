#!/bin/bash
# Make an LDD in a standard way.
# Output if written to standard out.
#
# Context:
#     $1, config: general information. Default: config.txt
#     $2, label: The set of ELEMENT_DEFINITION objects that define the PDS3 dictionary terms. Default: merged.cat
#     $3, output: Output file. Default: stdout

CONFIG=${1:-config.txt}    
LABEL=${2:-merged.cat}    
OUTPUT=${3:--}    

if [ $OUTPUT == "-" ]
then
/c/tools/igpp/docgen/bin/docgen config:$CONFIG convert:data-type.txt pds3:label:$LABEL make-ldd.vm
else
/c/tools/igpp/docgen/bin/docgen config:$CONFIG convert:data-type.txt pds3:label:$LABEL make-ldd.vm > $OUTPUT
fi
