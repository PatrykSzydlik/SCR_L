#!/bin/bash

#zakladamy kowencje ze w kazdej linii pliku adresy jest jeden adres email bez dodatkowych znakow
ADRES="./adresy.txt"
TEMAT="Zapytanie ofertowe"
TRESC="./tresc.txt"
PLIK="./spec*.pdf"

# Polecenie mail posiada skladnie:
# mail -s "TEMAT" ADRES -A PLIK < TRESC
# aby zaobserwowac wysylanie i uniknac konfiguracji serwera uzyje echo
# normalnie nalezaloby zastapic

while IFS= read -r line
do
    echo "mail -s \"$TEMAT\" $line -A $PLIK < $TRESC"  # zeby pokazac co sie wykonuje
    mail -s "$TEMAT" $line -A $PLIK < $TRESC
done <"$ADRES"