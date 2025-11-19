@echo off
REM Ask for project path
set /p project_path=Enter the path to your project (or '.' for current directory): 

REM Check if the input is empty or "." (current directory)
if "%project_path%"=="" set project_path=%cd%
if "%project_path%"=="." set project_path=%cd%

REM Navigate to the specified directory
cd /d "%project_path%"
if errorlevel 1 (
    echo Failed to access the directory. Please check the path.
    exit /b
)

REM Ask if you want to switch to the dev branch
set /p switch_branch=Do you want to switch to the dev branch? (y/n): 
if /i "%switch_branch%"=="y" (
    echo Switching to dev branch...
    git checkout dev
    if errorlevel 1 (
        echo Failed to switch to dev branch. Make sure it exists.
        exit /b
    )
) else (
    echo Skipping branch switch.
)

REM Pull the latest changes
echo Pulling the latest changes...
git pull
if errorlevel 1 (
    echo Failed to pull the latest changes. Please check your Git setup or internet connection.
    exit /b
)

echo Done! You are now on the dev branch with the latest changes.
pause
