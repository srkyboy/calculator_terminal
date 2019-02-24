#!/bin/bash

cd $TESTS_PATH
echo
echo
echo "Testing begins"
echo "************************************************************************************************************"
echo
echo

failed_tests=""
for f in $(ls)
do
	print="Running test $f"
	echo -n $print
	output=$(python3 $f | grep "$TEST_FRAMEWORK_ERROR")
	if [ "$output" = 'ERROR' ]; then
		echo -en "\r                                                                           "
		echo -e "\r\t ER .......$f"
		failed_tests="$failed_tests\t$f\n"
	else
		echo -en "\r                                                                           "
		echo -e "\r\t OK .......$f"
	fi
done

echo
echo
echo "List of failed tests:"
echo 

	echo -e $failed_tests

echo
echo
echo "************************************************************************************************************"
