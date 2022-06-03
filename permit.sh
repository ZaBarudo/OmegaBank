#!/bin/bash


chmod 770 OmegaBank
setfacl -R -m g:CEO:rwx OmegaBank

cd OmegaBank

for branch in Branch1 Branch2 Branch3 Branch4
do
    setfacl -R -m g:"${branch}MGR":rwx ${branch}
    chmod 770 ${branch}
    cd ${branch}
    for file in *
    do 

        setfacl -m g:${file}:r-x ${file}
        chmod 770 ${file}
    done
    cd ..
done


