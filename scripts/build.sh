#!/bin/sh

echo "开始打包"
# export_command = 'xcodebuild -exportArchive -archivePath /Users/liangk/Desktop/TestArchive/myArchivePath.xcarchive -exportPath /Users/liangk/Desktop/TestArchive/out -exportOptionsPlist /Users/liangk/Desktop/TestArchive/ExportOptions.plist'

# archive_command = 'xcodebuild archive -workspace %s/%s.xcworkspace -scheme %s -configuration Release -archivePath %s/%s' % (

xcrun xcodebuild archive -project DemoCi.xcodeproj -scheme DemoCi -configuration Release -archivePath ./scripts/build
echo "打包结束"

echo "开始导出"
xcrun xcodebuild -exportArchive -archivePath ./scripts/build/build.xcarchive -exportPath ./build -exportOptionsPlist ExportOptions.plist
echo "导出结束"
