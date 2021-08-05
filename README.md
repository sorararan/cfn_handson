## Cloudformation Hands-on
### 動作の流れ
#### 1. CodeBuildプロジェクト作成
`provision.yml` テンプレートから環境構築用のCodeBuildプロジェクトを作成する

#### 2. `provision.zip` の作成、S3にアップロード
CodeBuildプロジェクト上で構築する `handson.yml` テンプレートとそのテストを行う `ServerSpec` などをまとめてS3にアップロードすると、CodeBuildプロジェクトがトリガー実行される

実行後には `handson.yml` テンプレートの内容が構築される

### 使い方
#### 1. `.env` と `.ssh/my-key.pem` の作成
`.env` にCodeBuild上でaws-cliを実行するためのユーザ情報を記載する
```
export AWS_ACCESS_KEY_ID=xxxx
export AWS_SECRET_ACCESS_KEY=xxxx
export AWS_DEFAULT_REGION=xxxx
export AWS_DEFAULT_OUTPUT=text
```

また、テスト時にServerSpecでSSH接続を行うため、秘密鍵を配置する

#### 2. CodeBuildプロジェクト作成
```
aws cloudformation deploy --stack-name provision --template-file provision.yml --capabilities CAPABILITY_NAMED_IAM
```

#### 3. `provision.zip` の作成
CodeBuildで使うファイルをまとめる
```
zip -r provision.zip .env buildspec.yml .ssh serverspec sh handson.yml
```

#### 4. `provision.zip` のアップロード
手順2で作成されたS3に `provision.zip` をアップロードするとCodeBuildが実行する
```
aws s3 cp provision.zip s3://xxxx
```
