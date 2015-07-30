#!/bin/sh
cscope -Rbq
echo cscope -Rbq Done
ctags -R
echo ctags -R Done
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/"> filenametags
find . -not -regex '.*\.\(png\|gif\)'  ! -path "*svn*" -type f -printf "%f\t%p\t1\n" | sort -f>> filenametags
