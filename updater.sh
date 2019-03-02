#!/bin/bash
DIALOG=${DIALOG=dialog}

$DIALOG --title "OPPAH UPDATER" --clear \
	--yesno "Would you like to update your oppah?" 10 30

case $? in
	0)	cd ..; rm -rf oppah; rm oppah; git clone https://github.com/dakokonutboi/oppah.git; cd oppah; sh main.sh;;
	1)	echo "You chose not to update oppah."; sh main.sh;;
	255)	echo "Escape pressed";;
esac
