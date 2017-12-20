
#!/bin/sh
 
if [ $# -lt 1 ]; then
   echo "Usage: $0 <filename>"
   exit
fi
 
# Variables
#file=testfile.txt
file=$1
 
# First, change line number $linenum, then insert
# two spaces at the beginning of that same line
linenum=1
sed -i "${linenum}c This line was changed" $file
sed -i "${linenum}s/^/   /" $file
 
# Insert a line at $linenum, then insert text at 
# the end of that same line.
linenum=2
sed -i "${linenum}i This line was inserted" $file
sed -i "${linenum}s/$/ end of line/" $file
 
# Match a particular pattern in the file and insert a line
# directly above the first match (will need massaging for
# multiple lines, perhaps using an array)
linenum=`grep -n pattern $file | head -n1 | cut -d: -f1`
linenum_above=`echo "$linenum - 1" | bc`
sed -i "${linenum_above}i This line was inserted" $file
 
echo "Resulting File:"
cat $file
