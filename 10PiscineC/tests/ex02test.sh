#!bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'
YELLOW='\033[0;33m'

test()
{
	test_description="$1"
	shift

	./ft_tail "$@" > ft_tail_result 2>&1
	ft_tail_exit=$?
	tail "$@" > tail_result 2>&1
	tail_exit=$?

    if diff ft_tail_result tail_result > /dev/null 2>&1; then
        echo -e $GREEN"Test passed:$RESET $test_description"
    else
        echo -e $RED"Test failed:$RESET $test_description"
		echo -e $YELLOW$'tail result: '$RESET
		cat tail_result 
		echo ""
		echo -e $YELLOW$'ft_tail result: '$RESET
		cat ft_tail_result
		echo ""
    fi

	if [ $ft_tail_exit -ne $tail_exit ]; then
		echo -e $YELLOW"Warning: "$RESET "Different exit code: $test_description"
	fi

}

cd ../ex02;

make re > /dev/null

echo $'EX02 Test\n'

tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test1
tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test2
tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test3
tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test4
tr -dc A-Za-z0-9 < /dev/urandom | head -c 100 > test5

test "One byte, random file" -c1 test1
test "Zero bytes, random file" -c0 test1
test "10 bytes, many files" -c10 test1 test2 test3 test4 test5
test "Flag at the middle of files"  test1 test2 -c10 test3 test4 test5
test "Flag at the end of files"  test1 test2 test3 test4 test5 -c10
test "Flag separated from number" -c 10 test1 test2 test3 test4 test5
test "Many flags" -c 10 test1 test2 -c 1 test3 test4 test5 -c 5
test "No number for flag" -c test1 test2 test3 test4 test5
test "Files not found" -c20 ntf test1 ntf test2 ntf test3
test "Files not found, again" -c20 ntf test1 "" test2 "" ""
test "Invalid option" -o test1 test2 test3 test4 test5
test "Invalid numeric option with -" -5 test1 test2 test3 test4 test5
test "Valid numeric option with -" -c -5 test1 test2 test3 test4 test5
test "Invalid numeric format" -c --5 test1 test2 test3 test4 test5
test "Number too big" -c214532523532525729573289473294872398529572398748888224 test1 test2 test3 test4 test5
test "Number very big" -c29548888224 test1 test2 test3 test4 test5

rm -rf test1 test2 test3 test4 test5 tail_result ft_tail_result
make fclean > /dev/null

# Norminette
if norminette > /dev/null 2>&1; then
    echo -e $GREEN"Test passed:$RESET Norminette"
else
    echo -e $RED"Test failed:$RESET Norminette"
fi
