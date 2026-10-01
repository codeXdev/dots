function gco {
    git checkout @args
}

function gcb {
    git checkout -b @args
}

function gac {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    git add -A

    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ git add failed." -ForegroundColor Red
        return
    }

    git commit -m $Message

    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Commit failed. Nothing was pushed." -ForegroundColor Red
        return
    }

    $branch = git branch --show-current

    if ([string]::IsNullOrEmpty($branch)) {
        Write-Host "❌ Could not determine current branch." -ForegroundColor Red
        return
    }

    Write-Host "🚀 Pushing '$branch'..." -ForegroundColor Cyan
    git push origin $branch
}

function glog {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

function grh {
    git reset --hard
}

# Git switch and pull
function gprep {
    param(
        [Parameter(Mandatory = $false)]
        [string]$BranchName
    )

    # 1. Determine target branch
    if ([string]::IsNullOrEmpty($BranchName)) {

        $choice = Read-Host "Do you want to switch to 'dev'? (y/n)"

        if ($choice -match '^[yY](es)?$') {
            $TargetBranch = "dev"
        }
        else {
            Write-Host "Operation cancelled. No branch specified." -ForegroundColor Yellow
            return
        }
    }
    else {
        $TargetBranch = $BranchName
    }

    # 2. Check for modified tracked files
    $modifiedFiles = @(git status --porcelain | Where-Object {
        $_ -notmatch '^\?\?'
    })

    if ($modifiedFiles.Count -gt 0) {

        Write-Host ""
        Write-Host "You have modified tracked files that may block the switch/pull:" -ForegroundColor Yellow

        $fileList = @()

        foreach ($line in $modifiedFiles) {
            $filePath = $line.Substring(3)
            $fileList += $filePath

            Write-Host "  -> $filePath" -ForegroundColor DarkYellow
        }

        Write-Host ""
        Write-Host "How would you like to handle these modifications?" -ForegroundColor Cyan
        Write-Host " [A] Stash ALL modified files"
        Write-Host " [S] Stash a SINGLE specific file"
        Write-Host " [I] Ignore and proceed anyway"
        Write-Host " [Q] Quit/Abort"

        $action = (Read-Host "Choose an option (A/S/I/Q)").Trim().ToUpper()

        # A - Stash everything
        if ($action -eq "A") {

            Write-Host "Stashing all changes..." -ForegroundColor Cyan

            git stash push -m "Auto-stashed by gprep before moving to $TargetBranch"

            if ($LASTEXITCODE -ne 0) {
                Write-Host "Failed to stash changes." -ForegroundColor Red
                return
            }
        }

        # S - Stash one file
        elseif ($action -eq "S") {

            Write-Host ""
            Write-Host "Select the file you want to stash:" -ForegroundColor Cyan

            for ($i = 0; $i -lt $fileList.Count; $i++) {
                Write-Host " [$i] $($fileList[$i])"
            }

            $fileIndexStr = Read-Host "Enter the number of the file"

            [int]$fileIndex = -1

            $validIndex = [int]::TryParse(
                $fileIndexStr,
                [ref]$fileIndex
            )

            if (
                $validIndex -and
                $fileIndex -ge 0 -and
                $fileIndex -lt $fileList.Count
            ) {

                $selectedFile = $fileList[$fileIndex]

                Write-Host "Stashing file: $selectedFile..." -ForegroundColor Cyan

                git stash push `
                    -m "Auto-stashed single file: $selectedFile" `
                    -- $selectedFile

                if ($LASTEXITCODE -ne 0) {
                    Write-Host "Failed to stash '$selectedFile'." -ForegroundColor Red
                    return
                }
            }
            else {
                Write-Host "Invalid selection. Aborting workflow." -ForegroundColor Red
                return
            }
        }

        # I - Ignore
        elseif ($action -eq "I") {

            Write-Host "Proceeding without stashing..." -ForegroundColor Yellow
        }

        # Q - Quit
        elseif ($action -eq "Q") {

            Write-Host "Operation aborted." -ForegroundColor Red
            return
        }

        # Anything else
        else {

            Write-Host "Invalid choice. Aborting workflow." -ForegroundColor Red
            return
        }
    }

    # 3. Switch branch
    Write-Host ""
    Write-Host "Switching to branch '$TargetBranch'..." -ForegroundColor Cyan

    git checkout $TargetBranch

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to switch to branch '$TargetBranch'." -ForegroundColor Red
        return
    }

    # 4. Pull latest changes
    Write-Host "Pulling latest updates for '$TargetBranch'..." -ForegroundColor Cyan

    git pull origin $TargetBranch

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Pull failed." -ForegroundColor Red
        return
    }

    Write-Host "'$TargetBranch' is up to date." -ForegroundColor Green
}

function gpullr {
    param(
        [Parameter(Mandatory = $false, Position = 0)]
        [string]$TargetBranch
    )

    # 1. Check if current directory is a Git repo
    git rev-parse --is-inside-work-tree 2>$null | Out-Null

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Not a git repository." -ForegroundColor Red
        return
    }

    # 2. Fetch latest metadata
    Write-Host "Fetching origin..." -ForegroundColor Cyan

    git fetch origin

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to fetch from origin." -ForegroundColor Red
        return
    }

    # 3. Determine branch
    if ([string]::IsNullOrEmpty($TargetBranch)) {
        $TargetBranch = git branch --show-current
    }

    if ([string]::IsNullOrEmpty($TargetBranch)) {
        Write-Host "Could not determine current branch." -ForegroundColor Red
        return
    }

    # 4. Rebase-pull
    Write-Host "Rebase-pulling updates from origin/$TargetBranch..." -ForegroundColor Cyan

    git pull --rebase origin $TargetBranch

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Pull failed." -ForegroundColor Red
        return
    }

    Write-Host "Successfully updated $TargetBranch." -ForegroundColor Green
}

# Aliases / shortcuts
Set-Alias -Name gsp -Value gprep -ErrorAction SilentlyContinue

function gs {
    git status
}
