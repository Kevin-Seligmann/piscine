#!bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'
YELLOW='\033[0;33m'

# Regular test
do_test_usual()
{
	test_description="$1"
	shift

	./ft_cat "$@" >  ft_cat_result 2>&1
	ft_cat_exit=$?
	cat "$@" > cat_result 2>&1
	cat_exit=$?

    if diff ft_cat_result cat_result > /dev/null 2>&1; then
        echo -e $GREEN"Test passed:$RESET $test_description"
    else
        echo -e $RED"Test failed:$RESET $test_description"
		echo -e $YELLOW$'cat result: '$RESET
		cat cat_result 
		echo -e $YELLOW$'ft_cat result: '$RESET
		cat ft_cat_result
		echo ""
    fi

	if [ $ft_cat_exit -ne $cat_exit ]; then
		echo -e $YELLOW"Warning: "$RESET "Different exit code: $1"
	fi
}

# No args
do_test_no_arg()
{
	test_description="$1"
	shift

	./ft_cat < $1 > ft_cat_result 2>&1
	ft_cat_exit=$?
	cat < $1 > cat_result 2>&1
	cat_exit=$?

    if diff ft_cat_result cat_result > /dev/null 2>&1; then
        echo -e $GREEN"Test passed:$RESET $test_description"
    else
        echo -e $RED"Test failed:$RESET $test_description"
		echo $'\ncat: \n'
		cat cat_result 
		echo $'\nft_cat: \n'
		cat ft_cat_result
		echo ""
    fi

	if [ $ft_cat_exit -ne $cat_exit ]; then
		echo -e $YELLOW"Warning: "$RESET "Different exit code: $1"
	fi
}

cd ../ex01;

make re > /dev/null

echo $'EX01 Test\n'

# Tests
tr -dc A-Za-z0-9 < /dev/urandom | head -c 0 > test
do_test_usual "Empty file" test

do_test_usual "Many empty files" test test test test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test
do_test_usual "Single file" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test1
tr -dc A-Za-z0-9 < /dev/urandom | head -c 1 > test2
tr -dc A-Za-z0-9 < /dev/urandom | head -c 50 > test3
tr -dc A-Za-z0-9 < /dev/urandom | head -c 30 > test4
tr -dc A-Za-z0-9 < /dev/urandom | head -c 1000000 > test5
do_test_usual "Many files" test1 test2 test3 test4 test5

chmod 0 test3
do_test_usual "One file without permission" test3

do_test_usual "One file without permission at the end of many" test1 test2 test3

do_test_usual "One file without permission at the start" test3 test1 test2

do_test_usual "One file doesn't exist" asdqweqwdqw

do_test_usual "One file without permission, others don't exist" test1 asdqweqwdqw test3 test4

tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test
do_test_no_arg "No arguments" test

tr -dc A-Za-z0-9 < /dev/urandom | head -c 0 > test
do_test_no_arg "No arguments empty input" test

# Cleanup
rm -f test test1 test2 test3 test4 test5 cat_result ft_cat_result
make fclean > /dev/null

# Norminette
if norminette > /dev/null 2>&1; then
    echo -e $GREEN"Test passed:$RESET Norminette"
else
    echo -e $RED"Test failed:$RESET Norminette"
fi
