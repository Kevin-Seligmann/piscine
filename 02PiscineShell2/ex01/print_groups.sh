#!bin/sh

id $FT_USERS | tr ' ,' '\n' | cut -d '(' -f 2 | cut -d ')' -f 1
