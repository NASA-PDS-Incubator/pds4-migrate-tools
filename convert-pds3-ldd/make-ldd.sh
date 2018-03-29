#!/bin/bash
# Make an LDD in a standard way.
# Output if written to standard out.
#
# Context:
#     config: general information
#     label: The set of ELEMENT_DEFINITION objects that define the PDS3 dictionary terms

/c/tools/igpp/docgen/bin/docgen config:config.txt pds3:label:Messenger/merged.cat make-ldd.vm
