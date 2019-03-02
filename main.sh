#!/bin/sh
DIALOG=${DIALOG=dialog}
VERSION=$(head -n 1 version.txt)
 fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15
$DIALOG --clear --title "Oppah toolbox - $VERSION" \
	--menu "Choose a tool :" 20 75 10 \
	 "sh updater.sh" "Mettez a jour votre version d'oppah" \
	 "python passwordmanager.py" "Un generateur de mots de passe" \
	 "sh install_linux_package.sh" "Installez un paquet Unix" 2> \
	 "sh shell_command.sh" "Execute a Unix shell command" $fichtemp
valret=$?
choix=`cat $fichtemp`
case $valret in
 0)	$choix;;
 1) 	echo "Appuyé sur Annuler.";;
255) 	echo "Appuyé sur Echap.";;
esac
