#!/bin/sh
#
# Author: 	Daulton
# Website: 	daulton.ca
# Purpose: 	Updates an alias to become inactive, otherwise known as a Distribution List, in iRedmail.
# License: 	2-clause BSD license
#
# Example usage: sh set-alias-inactive.sh alias@mydomain.com
# 
# This will print SQL commands on the console directly, you can redirect the
# output to a file for further use like this:
#
# sh set-alias-inactive.sh alias@mydomain.com > output.sql
#
# Import output.sql into SQL database like below:
#
# mysql -uroot -p
# mysql> USE vmail;
# mysql> SOURCE /path/to/output.sql;
#
# psql -d vmail
# sql> \i /path/to/output.sql;

# Read input
aliasName="$1"

cat <<EOF
UPDATE forwardings SET active = '0' WHERE address = '${aliasName}' AND forwarding != '${aliasName}';
EOF
