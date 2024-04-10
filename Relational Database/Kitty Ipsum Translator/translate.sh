#!/bin/bash

cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'
# $1 refers to the first argument passed while calling this script. Similarly, $2 is the second, $3 is the third, etc.

# -E refers to extended regexp matching
# g refers to global matching. It maches all occcurences. Without this flag, it stops after matching the first word in a line
# multiple patterns matching arguments can be passed with sed by using semicolon