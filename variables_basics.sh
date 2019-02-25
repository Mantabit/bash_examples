#!/bin/bash

#define variables
var1=10
var2=20
var3=ABC
var4=DEF

#concatenate variables
var6=$var1+$var2
echo $var6
#concatenate variables and interprete the expression arithmetically
var5=$(($var1+$var2))
echo $var5

#---------------------------
#conditionals
#---------------------------
#here, the space characters are important (spaced between braces and other tokens)
#interpret '[' '==' and ']' as programs
if [ "a" = "B" ]; then
	echo expression evaluated as true
else
	echo expression evaluated as false
fi
#incorrect syntax due to missing space characters - expression evaluated (incorrectly) as true
if [ "a"="B" ]; then
	echo expression evaluated as true
else
	echo expression evaluated as false
fi

#---------------------------
#comparisons
# == (string comparisons) (-eq, -lt, -le, -gt, -ge, -ne) (numeric comparisons)
#---------------------------
num1=1
num2=10
if [ "$num2" -gt "$num1" ]; then
	echo "$num2 is greater than $num1"
fi

#---------------------------
#arrays
#---------------------------
myarr=(1 2 3 4 5 6 7 8 9)
echo ${myarr[0]}
#number of items in the array ${#myarr[*]}
echo "Number of items in the array: ${#myarr[*]}"
#get all objects in current directory and save them to array
dircontents=$(ls)

#---------------------------
#loops
#---------------------------
#for loop
for i in $(ls); do
	echo "current item: $i"
done

#while loop
counter=0
while [ $counter -lt 10 ]; do
	echo "current counter value: $counter"
	counter=$((counter+1)) #alternative: let counter+=1
done
