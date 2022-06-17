#!/bin/bash


chmod 771 OmegaBank
setfacl -R -m g:CEO:rwx OmegaBank


cd OmegaBank

for branch in Branch1 Branch2 Branch3 Branch4
do
    sudo setfacl -R -m g:"${branch}MGR":rwx ${branch}
    
    chmod 770 ${branch}
    cd ${branch}
    for file in $(ls . | head -n -3)
    do 

        sudo setfacl -m g:"${file}":r-x ${file}
        chmod 770 ${file}
    done
    cd ..
done

cd ..


