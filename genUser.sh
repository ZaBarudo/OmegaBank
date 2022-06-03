#!/bin/bash

mkdir OmegaBank
cd OmegaBank
echo $(pwd)

inputFile=$1
if [ -z $inputFile ]
then  # If the manager wants to add custom users, put the txt file in the files directory before passign as arg
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
    mkdir $branch
    sudo useradd -d $(pwd)/$branch "${branch}MGR"
    sudo passwd -d "${branch}MGR"  # Remove -d later
    touch "${branch}/Branch_Current_Balance.txt" "${branch}/Branch_Transaction_History.txt" 
done

while read -a line;  # Converting each line to array
do

    username=${line[0]}
    branch=${line[1]}
    type=${line[2]}
    age=${line[3]}
    legacy=${line[4]}

    mkdir "${branch}/${username}"  # Makes a directory for the user
    echo "500">"${branch}/${username}/Current_Balance.txt"  # Adding 500 to Current Balance
    touch "${branch}/${username}/Transaction_History.txt"  # Creating transaction history
    
    sudo useradd -d $(pwd)/${branch}/$username "${username}"
    sudo passwd -d "${username}"  # Remove -d later
    
done <<< $(cat $inputFile)


sudo useradd -d $(pwd) "CEO"
sudo passwd -d "CEO"  # Remove -d later

