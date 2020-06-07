#!/bin/sh

echo "开始上传"
echo "查看pgyer_upload是否已经下载,并且存在 ls ./scripts "
ls ./scripts
echo "查看是否有DemoCi.ipa文件 ls ./build "
ls ./build
./scripts/pgyer_upload.sh "./build/$APPNAME.ipa" $PGYER_APIKEY
