#!/bin/bash


# Pobiera wartości zmiennych środowiskowych jesli istnieją
N=$ENV_N
NAME=$ENV_NAME
TAR_NAME=$ENV_TAR_NAME

# Pobiera podane przez użytkownika opcjonalne argumenty
while getopts "ha:n:m:" arg; do
  case $arg in
    h)
      echo "   Correct usage: $0 [-a <string>] [-n <int>] [-m <string>] " 1>&2; exit 1;
      ;;
    a)
      TAR_NAME=$OPTARG
      ;;
    m)
      NAME=$OPTARG
      ;;
    n)
      N=$OPTARG
      ;;
  esac
done

# W wypadku braku argumentu i braku zmiennej środowiskowej zapytamy użytkownika o argumenty
if [ -z "${NAME}" ]; then
    echo " Podaj argument maski dla nazwy wyszukiwanych plików:  "
    read NAME 
fi

if [ -z "${N}" ]; then
    echo " Podaj ilośc dni od modyfikacji:  "
    read N
fi

if [ -z "${TAR_NAME}" ]; then
    echo " Podaj nazwę dla archiwum tar:  "
    read TAR_NAME
fi


# wykonanie się programu
echo "find $HOME -mtime +$N -name "$NAME" -print0 | tar -cvf ./$TAR_NAME.tar --null -T - "
find $HOME -mtime +$N -name "$NAME" -print0 | tar -cvf ./$TAR_NAME.tar --null -T - 