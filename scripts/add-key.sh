#!/bin/sh
# Create a custom keychain
security create-keychain -p travis ios-build.keychain
security default-keychain -d user -s ios-build.keychain
security unlock-keychain -p travis ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain


security import ./scripts/certs/AppleWWDRCA.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign

echo "导入cer证书"
security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
echo "cer证书导入完毕"

echo "导入p12证书"
security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P "123456" -A
echo "p12证书导入完毕"

security set-key-partition-list -S apple-tool:,apple: -s -k travis ios-build.keychain

echo "list keychains: "
security list-keychains
echo " ****** "

echo "find indentities keychains: "
security find-identity -p codesigning  ~/Library/Keychains/ios-build.keychain
echo " ****** "

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "./scripts/profile/TravisCIADHoc.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/
