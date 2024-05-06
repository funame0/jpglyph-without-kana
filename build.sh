#!/bin/sh
ORIGINAL_PATCH_PATH=unifont_jp/unifont_jp_patch-15.1.04.hex

ZIP_PATH=dist/assets/minecraft/font/unifont_jp.zip
HEX_PATH=.temp/unifont_jp_patch-without-kana.hex

cd $(dirname $0)

mkdir -p .temp

rm -rf dist
cp -r src dist

mkdir -p dist/assets/minecraft/font

sed '/^30..:/d' $ORIGINAL_PATCH_PATH > $HEX_PATH
zip -j $ZIP_PATH unifont_jp/LICENSE.txt $HEX_PATH

(
  cd dist
  zip -r jpglyph_without_kana.zip .
  mv jpglyph_without_kana.zip ..
)

trap 'rm -rf .temp' 0
