& build.ps1

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

ssh catrol@catrol.cn -t "cd /opt/1panel/apps/openresty/openresty/www/sites/kitx.apps.catrol.cn/index; sudo git checkout deploy; sudo git pull; sudo tar -xf dist.tar"

Write-Output ""
Write-Output "Press any key to continue ..."

[void][System.Console]::ReadKey($true)
