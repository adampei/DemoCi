#!/bin/sh

echo "开始上传"
echo "查看pgyer_upload是否已经下载,并且存在 ls ./scripts "
ls ./scripts
echo "查看是否有DemoCi.ipa文件 ls ./scripts/build "
ls ./scripts/build
./scripts/pgyer_upload.sh ./scripts/build/$APPNAME.ipa "64b07d6a2da9902db04e3b93cd9968da"
