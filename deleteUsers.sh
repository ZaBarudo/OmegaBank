#!/bin/bash

# Used to delete all users and managers Created
cd "$(pwd)/OmegaBank"
echo $(pwd)

inputFile=$1
if [ -z $inputFile ]
then  # If the manager wants to add custom users, put the txt file in the files directory before passign as arg
    echo $(pwd)
    echo "Using User_Accounts.txt to create users..."
    inputFile="../files/User_Accounts.txt"
else
    if [ -f "../files/$inputFile" ]
    then
        echo "$inputFile is present in the Files Directory"
    else
        echo "$inputFile is not present in the Files Directory"
        exit 1
    fi
fi

for branch in Branch1 Branch2 Branch3 Branch4
do
    
    sudo userdel -f "${branch}MGR"
    
done

while read -a line;  # Converting each line to array
do

    username=${line[0]}
    branch=${line[1]}
    type=${line[2]}
    age=${line[3]}
    legacy=${line[4]}

    sudo userdel -f "${username}"
    
    
done <<< $(cat $inputFile)

sudo userdel -f "CEO"