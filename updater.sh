#!/bin/sh
DIALOG=${DIALOG=dialog}
 fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15
$DIALOG --clear --title "Mon chanteur français favori" \
	--menu "Bonjour, choisissez votre chanteur français favori :" 20 51 4 \
	 "Brel" "Jacques Brel" \
	 "Aznavour" "Charles Aznavour" \
 	 "Brassens" "Georges Brassens" \
	 "Nougaro" "Claude Nougaro" \
	 "Souchon" "Alain Souchon" \
	 "Balavoine" "Daniel Balavoine" 2> $fichtemp
valret=$?
choix=`cat $fichtemp`
case $valret in
 0)	echo "'$choix' est votre chanteur français préféré";;
 1) 	echo "Appuyé sur Annuler.";;
255) 	echo "Appuyé sur Echap.";;
esac
cd ..
git clone https://github.com/dakokonutboi/oppah.git
