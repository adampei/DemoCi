#!/bin/sh
xcrun xcodebuild -project DemoCi.xcodeproj -scheme DemoCi \
  -archivePath DemoCi.xcarchive archive

xcrun xcodebuild -exportArchive -archivePath DemoCi.xcarchive \
  -exportPath ./build -exportOptionsPlist ExportOptions.plist

