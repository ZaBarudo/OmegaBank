#!/bin/bash

alias genUser="find / -type f -name genUser.sh 2>/dev/null | bash"
alias allotInterest="find / -type f -name allotInterest.sh 2>/dev/null | bash"
alias makeTransaction="find / -type f -name makeTransaction.sh 2>/dev/null | bash"
alias permit="find / -type f -name permit.sh 2>/dev/null | bash"
alias updateBranch="find / -type f -name updateBranch.sh 2>/dev/null | bash"
chmod 760 genUser.sh allotInterest.sh permit.sh makeTransaction.sh updateBranch.sh

source ~/.bashrc