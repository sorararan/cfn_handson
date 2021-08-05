## Cloudformation Hands-on
### 使い方
#### 1. `.env` の作成
`.env` にCodeBuild上でaws-cliを実行するためのユーザ情報を記載
```
export AWS_ACCESS_KEY_ID=xxxx
export AWS_SECRET_ACCESS_KEY=xxxx
export AWS_DEFAULT_REGION=xxxx
export AWS_DEFAULT_OUTPUT=text
```

#### 2. CodeBuild環境のプロビジョニング
```
aws cloudformation deploy --stack-name provision --template-file provision.yml --capabilities CAPABILITY_NAMED_IAM
```

#### 3. `provision.zip` の作成
CodeBuildで使うファイルをまとめる
```
zip -r provision.zip .env handson.yml buildspec.yml
```

#### 4. `provision.zip` のアップロード
手順2で作成されたS3に `provision.zip` をアップロードするとCodeBuildが実行する
```
aws s3 cp provision.zip s3://xxxx
```
