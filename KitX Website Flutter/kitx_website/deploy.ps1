## Clean built files
flutter clean

## Build with web profile
flutter build web --release --web-renderer canvaskit --tree-shake-icons --no-web-resources-cdn

## Run optimizer to reduce the size of the built files
# flutter pub run flutter_web_optimizer optimize --asset-base https://kitx.apps.catrol.cn/

Remove-Item -r dist

mkdir dist

Copy-Item -r ./build/web/* dist/

Move-Item dist ../../

Set-Location ../../

git add dist

git stash

Remove-Item -r dist -Recurse -Force

git checkout deploy

Remove-Item -r dist -Recurse -Force

git add .

git commit -m "Clean old files"

git stash pop

git add .

git commit -m "Deploy new files"
