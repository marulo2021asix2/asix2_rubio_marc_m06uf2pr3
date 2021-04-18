#!/bin/bash
#Script backup.sh Marc Rubio Lopez

echo -n "Indica la ruta del arxiu: "
read ruta
echo -n "Indica la ruta el arxiu que es vol copiar: "
read arxiu
echo -n "Ruta indicada: $ruta/$arxiu"
echo ""
DIR="/home/marulo/FitxConfBackup" #ruta Marc Rubio Lopez
if [ -d "$DIR" ]; then
  echo "EL directori FitxConfBackup ja existeix"
else
  echo "El directori ${DIR} no existeix, creant..."
  mkdir /home/marulo/FitxConfBackup
fi
FILE=/home/marulo/$arxiu
if [ -f $FILE ]; then
    echo "$FILE ja existeix, sobreescribint"
    cp "$ruta/$arxiu" /home/marulo/FitxConfBackup
    else
  echo "L'arxiu no existeix, creant el arxiu"
  cp "$ruta/$arxiu" /home/marulo/FitxConfBackup
fi
exit 0


