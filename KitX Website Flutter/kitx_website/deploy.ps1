## Clean built files
flutter clean

## Build with web profile
flutter build web --release --web-renderer canvaskit --no-tree-shake-icons --no-web-resources-cdn

## Run optimizer to reduce the size of the built files
# flutter pub run flutter_web_optimizer optimize --asset-base https://kitx.apps.catrol.cn/

mkdir dist

Copy-Item -r ./build/web/* dist/

Move-Item dist ../../

Set-Location ../../

tar -cf dist.tar dist

Remove-Item -r dist

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
