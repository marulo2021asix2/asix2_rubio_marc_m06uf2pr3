#!/bin/bash
#Script ctrlsrv.sh Marc Rubio Lopez

if [[ $EUID -ne 0 ]]; then
   echo "Has de ser root per executar aquest script"
   exit 1
fi
function mostra_serveis(){
clear
echo "--MENU--"
PS3='Escull un servei: '
options=("cups" "ssh" "apache2" "Sortir")
select opt in "${options[@]}"
do
    case $opt in
        "cups")
            ctrl_servei_cups
            ;;
        "ssh")
            ctrl_servei_ssh
            ;;
        "apache2")
           ctrl_servei_apache2
            ;;
        "Sortir")
            break
            ;;
        *) echo "opció no valida $REPLY";;
    esac
done
}
ctrl_servei_cups() {
STATUS="$(systemctl is-active cups.service)"
if [ "${STATUS}" = "active" ]; then
    echo "El servei cups ja està en marxa"
else
    echo "Arrencant el servei cup..."  
    sudo systemctl start cups
     echo "Servei arrencat"  
    exit 0
fi
}
ctrl_servei_ssh() {
STATUS="$(systemctl is-active ssh.service)"
if [ "${STATUS}" = "active" ]; then
    echo "El servei ssh ja està en marxa"
else
    echo "Arrencant el servei ssh..."  
    sudo systemctl start ssh
     echo "Servei arrencat"  
    exit 0
fi
}
ctrl_servei_apache2() {
STATUS="$(systemctl is-active apache2.service)"
if [ "${STATUS}" = "active" ]; then
    echo "El servei apache2 ja està en marxa"
else
    echo "Arrencant el apache2..."  
    sudo systemctl start apache2
     echo "Servei arrencat"  
    exit 0
fi
}
