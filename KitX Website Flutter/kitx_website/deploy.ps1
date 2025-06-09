. $PSScriptRoot/build.ps1
git add dist.tar
git stash
git checkout deploy

Remove-Item dist.tar

git add .
git commit -m "Clean old files"
git stash pop
git add .
git commit -m "Deploy new files"
git push
git checkout dev=main

Write-Output ""
Write-Output "Press any key to update server ..."

[void][System.Console]::ReadKey($true)

ssh git@git.catrol.cn -t "sudo bash -c ~/maintain/update-kitx.apps.catrol.cn.sh"

Write-Output ""
Write-Output "Press any key to continue ..."

[void][System.Console]::ReadKey($true)
