#!/bin/sh
DIALOG=${DIALOG=dialog}
fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15
$DIALOG --title "Shell command" --clear \
        --inputbox "Type the Unix command you would like to execute :" 16 51 2> $fichtemp

valret=$?

case $valret in
  0)
    `cat $fichtemp`;sh main.sh;;
  1)
    echo "Appuyé sur Annuler.";;
  255)
    if test -s $fichtemp ; then
        cat $fichtemp
    else
        echo "Appuyé sur Echap."
    fi
    ;;
esac
