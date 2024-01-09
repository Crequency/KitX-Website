
# Clean built files
flutter clean

# Build with web profile
flutter build web --web-renderer html --release

# Run optimizer to reduce the size of the built files
flutter pub run flutter_web_optimizer optimize --asset-base https://kitx.apps.catrol.cn/
