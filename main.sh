#!/bin/sh
DIALOG=${DIALOG=dialog}
 fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15
$DIALOG --clear --title "Oppah toolbox" \
	--menu "Choose a tool :" 20 51 4 \
	 "sh updater.sh" "Mettez a jour votre version d'oppah" \
	 "python passwordmanager.py" "Un generateur de mots de passe" 2> $fichtemp
valret=$?
choix=`cat $fichtemp`
case $valret in
 0)	$choix;;
 1) 	echo "Appuyé sur Annuler.";;
255) 	echo "Appuyé sur Echap.";;
esac
