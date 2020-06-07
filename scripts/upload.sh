#!/bin/sh

echo "开始上传"
echo "查看pgyer_upload是否已经下载,并且存在 ls ./scripts "
ls ./scripts
echo "查看是否有DemoCi.ipa文件 ls ./scripts/build "
ls ./scripts/build

path_ipa=$(pwd)/scripts/build
echo "拼接的路径为: "
echo "$path_ipa"
./scripts/pgyer_upload.sh "$path_ipa/$APPNAME.ipa" "64b07d6a2da9902db04e3b93cd9968da"
