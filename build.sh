# Herhangi bir komut başarısız olursa script'i hemen durdurur.
set -e

# --- Flutter Kurulumu (Belirli bir versiyonu kullanmak için) ---

# Netlify'ın build ortamında hangi Flutter versiyonunun kullanılacağını burada belirliyoruz.
# 'stable' en son kararlı sürümü klonlar. İsterseniz "3.16.9" gibi spesifik bir versiyon da yazabilirsiniz.
FLUTTER_VERSION="stable"

echo "Cloning Flutter repository for version: $FLUTTER_VERSION..."
git clone https://github.com/flutter/flutter.git --depth 1 --branch $FLUTTER_VERSION

# Klonlanan Flutter'ı sistem yoluna (PATH) ekliyoruz ki `flutter` komutunu kullanabilelim.
export PATH="$PWD/flutter/bin:$PATH"

# --- Kurulumu Doğrula ---
echo "Using Flutter version:"
flutter --version

# --- Flutter Web Uygulamasını İnşa Etme ---
# BÜTÜN KOMUTLAR PROJENİN KÖK DİZİNİNDE ÇALIŞTIRILMALIDIR.

echo "Getting project dependencies..."
flutter pub get

echo "Building Flutter web application..."
flutter build web

echo "Build process finished successfully!"
