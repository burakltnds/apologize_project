set -e

FLUTTER_VERSION="stable"

echo "Cloning Flutter repository for version: $FLUTTER_VERSION..."
git clone https://github.com/flutter/flutter.git --depth 1 --branch $FLUTTER_VERSION

export PATH="$PWD/flutter/bin:$PATH"

echo "Using Flutter version:"
flutter --version

echo "Getting project dependencies..."
flutter pub get

echo "Building Flutter web application..."
flutter build web

echo "Build process finished successfully!"
