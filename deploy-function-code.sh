#!/bin/bash

rm -f func.zip

pushd func
yarn install
zip -r ../func.zip *
popd

aws lambda update-function-configuration \
    --function-name "codeAssets" \
    --region "us-east-1"

aws lambda update-function-code \
    --function-name "codeAssets" \
    --zip-file "fileb://./func.zip" \
    --region "us-east-1"