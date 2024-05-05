
@echo off
setlocal enabledelayedexpansion

echo Installing Apps

for %%A in (
    "7zip.7zip"
    "Git.Git"
    "GnuWin32.Grep"
    "BurntSushi.ripgrep.MSVC"
    "MSYS2.MSYS2"
) do (
    set "app=%%~A"
    set "listApp="
    for /f %%B in ('winget list --exact -q !app!') do set "listApp=!listApp!%%B"
    if "!listApp!" == "" (
        echo Installing: !app!
        winget install -e -h --accept-source-agreements --accept-package-agreements --id !app!
    ) else (
        echo Skipping: !app! (already installed)
    )
)

endlocal
