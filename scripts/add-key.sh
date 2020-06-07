#!/bin/sh
security create-keychain -p travis ios-build.keychain
security default-keychain -s ios-build.keychain

security unlock-keychain -p travis ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain

security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/profile/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

echo "find indentities keychains: "
security find-identity -p codesigning ~/Library/Keychains/ios-build.keychain
echo " find indentities keychains over "
echo "list keychains: "
security list-keychain
echo " list keychains over "



# Create a custom keychain
#security create-keychain -p travis ios-build.keychain
#security default-keychain -d user -s ios-build.keychain
#security unlock-keychain -p travis ios-build.keychain
#security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain
#
#echo "导入cer证书"
#security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
#echo "cer证书导入完毕"

#echo "导入p12证书"
#security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -A
#echo "p12证书导入完毕"
#
#echo "list keychains: "
#security list-keychains
#echo " ****** "
#
#echo "find indentities keychains: "
#security find-identity -p codesigning  ~/Library/Keychains/ios-build.keychain
#echo " ****** "
#
#mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
#cp "./scripts/profile/TravisCIADHoc.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/
