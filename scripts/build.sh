#!/bin/sh

echo "开始打包"
xcrun xcodebuild -project DemoCi.xcodeproj -scheme DemoCi \
  -archivePath DemoCi.xcarchive archive
echo "打包结束"

echo "开始签名"
xcrun xcodebuild -exportArchive -archivePath DemoCi.xcarchive \
  -exportPath ./build -exportOptionsPlist ExportOptions.plist
echo "签名结束"
