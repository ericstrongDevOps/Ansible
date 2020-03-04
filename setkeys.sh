#!/bin/bash
file="./hosts"
while read -r line p; 
do
    l=( $p )
    ip=${l[0]}
    user=$(echo $p | cut -d' ' -f1 | cut -d'=' -f2)
    exec 'ssh-copyid -i ~/.ssh/id_rsa.pub' $user'@'$ip
    
done < <(tail -n +2 hosts)
