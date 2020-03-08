#!/bin/bash
ssh-add -K POC.pem
ssh-add –L

while read p; 
do
    l=( $p )
    ip=${l[0]}
    user=${l[1]}
    
    user=$(echo $user | cut -d'=' -f2)
    #echo 'ssh-copy-id -i ~/.ssh/id_rsa.pub' $user'@'$ip
    #ssh-copy-id -i ~/.ssh/id_rsa.pub $user'@'$ip
    ssh –A $user@$ip
    
done < <(tail -n +2 hosts)
