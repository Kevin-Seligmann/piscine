#!bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

# Regular test
do_test_usual()
{
    ./ft_display_file "$2" > result 2>&1
    if diff result test > /dev/null 2>&1; then
        echo -e $GREEN"Test passed:$RESET $1"
    else
        echo -e $RED"Test failed:$RESET $1"
    fi
}

# Error test
do_test_error()
{
    ./ft_display_file $3 $4 $5 > result 2>&1
	echo $1 > test
    if diff result test > /dev/null 2>&1; then
        echo -e $GREEN"Test passed:$RESET $2"
    else
        echo -e $RED"Test failed:$RESET $2"
    fi
}

cd ../ex00;

make re > /dev/null

echo $'EX00 Test -- Suggestion: Put buffer size at 10 \n'

# Regular tests
tr -dc A-Za-z0-9 < /dev/urandom | head -c 9 > test
do_test_usual "File of size 9" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 10 > test
do_test_usual "File of size 10" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 11 > test
do_test_usual "File of size 11" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 1000000 > test
do_test_usual "File of size 1000000" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 1 > test
do_test_usual "File of size 1" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 0 > test
do_test_usual "File of size 0" test

# Error tests
do_test_error $'File name missing.\n' "No arguments"

do_test_error $'Too many arguments.\n' "2 Arguments" test.sh test.sh

do_test_error $'Too many arguments.\n' "3 Arguments" test.sh test.sh test.sh

do_test_error $'Cannot read file.\n' "File doesn't exist" "noexiste.sh"

touch noperm; chmod 0 noperm
do_test_error $'Cannot read file.\n' "No permission" "noperm"

# Clean up
make fclean > /dev/null
rm -f result test noperm

# Norminette
if norminette > /dev/null 2>&1; then
    echo -e $GREEN"Test passed:$RESET Norminette"
else
    echo -e $RED"Test failed:$RESET Norminette"
fi
