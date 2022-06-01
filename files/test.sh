#!/bin/bash

input="./files/User_Accounts.txt"
######################################
# $IFS removed to allow the trimming # 
#####################################
user_accs=()
var=0
for acc in $(cut -d" " -f1 "$input")
do 
    user_accs[$var]=$acc
    var=$var+1
done

