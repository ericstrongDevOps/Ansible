#!/bin/bash
file="./hosts"
while read p; 
do
    l=( $p )
    ip=${l[0]}
    user=${l[1]}
    
    user=$(echo $user | cut -d'=' -f2)
    echo 'ssh-copyid -i ~/.ssh/id_rsa.pub' $user'@'$ip
    
done < <(tail -n +2 hosts)
