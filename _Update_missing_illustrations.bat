@echo off
setlocal enabledelayedexpansion

echo Recherche des illustrations manquantes...

set "excluded_dirs=_inc _support _basicCustom resources"
set "missing_count=0"
set "image_file=art.png"
set "output_file=_missing_illustrations.txt"

echo Dossiers avec illustrations manquantes (fichier: %image_file%) :
(
    for /d %%d in (*) do (
        set "found=false"
        for %%e in (%excluded_dirs%) do (
            if /i "%%d"=="%%e" (
                set "found=true"
                break
            )
        )
        if "!found!"=="false" (
            if not exist "%%d\%image_file%" (
                set /a missing_count+=1
                echo %%d
            )
        )
    )
) > "%output_file%"

if %missing_count% equ 0 (
    echo Aucune illustration manquante trouvée.
) else (
    echo Nombre de dossiers avec illustrations manquantes : %missing_count%
    echo Les résultats ont été enregistrés dans : %output_file%
)

pause

echo Fin du scan.