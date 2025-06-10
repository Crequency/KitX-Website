param (
    [Parameter()]
    [switch]$BypassBuild = $false,
    [Parameter()]
    [switch]$UseBuildCache = $false
)

function Save-GitBranch {
    $currentBranch = git rev-parse --abbrev-ref HEAD
    return $currentBranch
}

if ($BypassBuild -and $UseBuildCache) {
    Write-Output ">>> You can not bypass build and use build cache at the same time."
    exit 1
}

if (-not $BypassBuild -and -not $UseBuildCache) {
    Write-Output ">>> Current changes stashed"
    git add .
    git stash
    $lastBranch = Save-GitBranch
    Write-Output ">>> Building ..."
    Push-Location $PSScriptRoot
    ./build.ps1
    Write-Output ">>> Committing ..."
    git checkout deploy
    Push-Location ../../
    if (Test-Path -Path dist) {
        Remove-Item -Recurse -Force dist
    }
    Move-Item ../dist ./
    git add ./dist -f
    git commit -m "Deploy new files"
    git push server --all
    Pop-Location
    Pop-Location
    Write-Output ">>> Restore stashed changes ..."
    git checkout $lastBranch
    git stash pop

    Write-Output ""
    Write-Output "Press any key to update server ..."

    [void][System.Console]::ReadKey($true)
}

if ($UseBuildCache -and -not $BypassBuild) {
    Write-Output ">>> Current changes stashed"
    git add .
    git stash
    $lastBranch = Save-GitBranch
    Write-Output ">>> Using build cache ..."
    Push-Location $PSScriptRoot
    New-Item -Path ./dist -ItemType Directory -Force | Out-Null
    Copy-Item ./build/web/* ./dist -Recurse -Force
    Move-Item ./dist ../../../ -Force
    Push-Location ../../
    git checkout deploy
    if (Test-Path -Path dist) {
        Remove-Item -Recurse -Force dist
    }
    Move-Item ../dist ./ -Force
    git add ./dist -f
    git commit -m "Deploy new files"
    git push server --all
    Pop-Location
    Pop-Location
    Write-Output ">>> Restore stashed changes ..."
    git checkout $lastBranch
    git stash pop
}

ssh git@git.catrol.cn -t "sudo bash -c ~/maintain/update-kitx.apps.catrol.cn.sh"

Write-Output ""
Write-Output "Press any key to continue ..."

[void][System.Console]::ReadKey($true)
