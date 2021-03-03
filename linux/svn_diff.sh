#############################################i
# edit ~/.subversion/config as:
# [helpers]
# diff-cmd = current path/svn_diff.sh

# you can use -x -ub after svn diff 
# diff-cmd = /usr/bin/diff
#############################################i

#!/bin/bash
#@shift 5
#@
#@# 使用vimdiff比较
#@vimdiff "$@"

#!/bin/sh

# Configure your favorite diff program here.
DIFF="/data/home/lebyzhao/apps/vim81/bin/vimdiff"

# Subversion provides the paths we need as the sixth and seventh 
# parameters.
LEFT=${6}
RIGHT=${7}

# Call the diff command (change the following line to make sense for
# your merge program).
$DIFF $LEFT $RIGHT

# Return an errorcode of 0 if no differences were detected, 1 if some were.
# Any other errorcode will be treated as fatal.
