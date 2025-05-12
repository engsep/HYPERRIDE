#!/bin/bash
# Convertito da upload-file.here.bat

## Prende il percorso completo del file dal primo argomento
file="$1"

## Estrae il nome del file con estensione
filename="$(basename "$file")"

## Codifica gli spazi nel nome del file con "%20"
filename_encoded="${filename// /%20}"

## Stampa informazioni
echo "File              : $file"
echo "File name         : $filename"
echo "File name encoded : $filename_encoded"

## Carica il file tramite curl (con progress bar)
curl --progress-bar --upload-file "$file" "https://engsep.duckdns.org/api/upload/$filename_encoded" -H "Content-Type: application/octet-stream"
