#!/bin/sh

echo "开始打包"
# export_command = 'xcodebuild -exportArchive -archivePath /Users/liangk/Desktop/TestArchive/myArchivePath.xcarchive -exportPath /Users/liangk/Desktop/TestArchive/out -exportOptionsPlist /Users/liangk/Desktop/TestArchive/ExportOptions.plist'

# archive_command = 'xcodebuild archive -workspace %s/%s.xcworkspace -scheme %s -configuration Release -archivePath %s/%s' % (

xcrun xcodebuild archive -project DemoCi.xcodeproj -scheme DemoCi -configuration Release -archivePath ./scripts/build
echo "打包结束"

echo "开始导出"
xcrun xcodebuild -exportArchive -archivePath ./scripts/build.xcarchive -exportPath ./scripts/build -exportOptionsPlist ExportOptions.plist
echo "导出结束"
echo "查看build目录 ls ./scripts/build "
ls ./scripts/build
echo "build目录查看结束"
echo "绝对路径 $pwd"

#path_ipa=$(pwd)/scripts/build
#
#echo "蒲公英开始上传"
#curl -F "file=@/$path_ipa/$APPNAME.ipa" -F "uKey=3f878d3cd17199c9b2ea54513b885f28" -F "_api_key=64b07d6a2da9902db04e3b93cd9968da" https://upload.pgyer.com/apiv1/app/upload
#
#echo "蒲公英上传完成"

