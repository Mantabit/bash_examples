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
