# JMeterをDocker環境で使いたかった

JMeterをDocker環境で動かすために作ったリポジトリです.

## optionの指定方法

- JMXファイルの指定方法
  - /jmeter.jmxにマウントする
- results fileの指定方法
  - /jmeter.resultにマウントする
- レポートの出力先を指定する
  - /opt/jmeter/reportsをマウントする

## 実行方法

- ビルドする
  - `docker build -t jmeter:8-jre-alpine3.9 .`
  - タグは自由だけど、わかりやすいものを指定すること
- 実行する
  - `docker run -it --rm -v ${pwd}/SampleWebApp.jmx:/jmeter.jmx jmeter:8-jre-alpine3.9`
  - ポイント
    - `-v`マウントで作成済みのjmxを`/jmeter.jmx`にマウントする
    - `--rm`optionを指定し、終了したコンテナが残らないようにする
