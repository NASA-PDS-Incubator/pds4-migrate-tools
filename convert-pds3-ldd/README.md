# Convert PDS3 Dictionary to PDS4 LDD

**Caution: Still under development**

A set of scripts and templates to convert a PDS3 dictionary to a PDS4 LDD.

File         | Purpose
------------ + ---------------------
config.txt   | Sample configuration file used with docgen to create the PDS4 LDD
make-ldd.sh  | Script to run [docgen](http://release.igpp.ucla.edu/igpp/docgen/) with the necessary options.
make-ldd.vm  | Velocity template for generating the PDS4 LDD
merge-cat.sh | Script to combine multiple PDS4 CAT dictionary files into a single file.

Steps to convert a PDS3 dictionary to PDS4 LDD

1. Download all catalog files

    Example: `wget -r -np -nH --cut-dirs=1 --no-check-certificate https://pdsimage2.wr.usgs.gov/archive/mess-e_v_h-mdis-2-edr-rawdata-v1.0/MSGRMDS_1001/DOCUMENT/LDD/`
    
	Note: The path in the URL will be replicated in your local copy.
	
2. Concatenate all catalog files into a single file (run in LDD folder)  

    Example: `bash merge-cat.sh ../merged.cat`
    
	Note: PIV_GOAL cat file has a multiple line revision note that is partially removed during concatenation.
	You must manually edit the output file to correct the issue.
	
3. Run [docgen](http://release.igpp.ucla.edu/igpp/docgen/) with template

     Example: `docgen -v config:config.txt pds3:label:Messenger/merged.cat make-ldd.vm > my-ldd.vm`
	 
4. Run [lddtool](https://pds.nasa.gov/pds4/software/ldd/) to generate LDD files

     example: lddtool -pl myldd.xml