param (
    [Parameter()]
    [switch]$BypassBuild = $false
)

function Save-GitBranch {
    $currentBranch = git rev-parse --abbrev-ref HEAD
    return $currentBranch
}

if (-not $BypassBuild) {
    Write-Output ">>> Current changes stashed"
    git add .
    git stash
    $lastBranch = Save-GitBranch
    Write-Output ">>> Building ..."
    . $PSScriptRoot/build.ps1
    Write-Output ">>> Committing ..."
    git checkout deploy
    Move-Item ../../../dist ./
    git add .
    git commit -m "Deploy new files"
    git push
    git checkout $lastBranch
    if (Test-Path dist) {
        Remove-Item dist -Recurse -Force
    }

    Write-Output ""
    Write-Output "Press any key to update server ..."

    [void][System.Console]::ReadKey($true)
}

ssh git@git.catrol.cn -t "sudo bash -c ~/maintain/update-kitx.apps.catrol.cn.sh"

Write-Output ""
Write-Output "Press any key to continue ..."

[void][System.Console]::ReadKey($true)
