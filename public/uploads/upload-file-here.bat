@echo off
setlocal enabledelayedexpansion

:: Prende il percorso completo del file trascinato o dal primo argomento
set "file=%~1"

:: Estrae il nome del file con estensione
set "filename=%~nx1"

:: Codifica gli spazi nel nome del file con "%20"
set "filename_encoded=!filename: =%%20!"

:: Stampa informazioni
echo File              : %file%
echo File name         : %filename%
echo File name encoded : %filename_encoded%

:: Carica il file tramite curl (con progress bar)
curl --progress-bar --upload-file "%file%" "https://engsep.duckdns.org/api/upload/%filename_encoded%" -H "Content-Type: application/octet-stream" | more

endlocal
pause
