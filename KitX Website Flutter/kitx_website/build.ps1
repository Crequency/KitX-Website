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
