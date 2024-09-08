param(
    [string]$baseHref = "/"
)

## Clean built files
flutter clean

## Make sure custom build scripts are executed
dart run build_runner build --delete-conflicting-outputs

## Build with web profile
flutter build web --release --web-renderer canvaskit --no-tree-shake-icons --no-web-resources-cdn --base-href "$baseHref"

## Run optimizer to reduce the size of the built files
# flutter pub run flutter_web_optimizer optimize --asset-base https://kitx.apps.catrol.cn/

mkdir dist

Copy-Item -r ./build/web/* dist/

Move-Item dist ../../

Set-Location ../../

tar -cf dist.tar dist

Remove-Item -r dist
