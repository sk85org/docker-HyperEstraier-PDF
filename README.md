# docker-HyperEstraier-PDF
## docker-HyperEstraier-PDFとは
docker-HyperEstraierを使うことでDockerコンテナ上で[Hyper Estraier](https://dbmx.net/hyperestraier/)を用いたPDF全文検索システムが迅速に構築できます。

## 使い方
### 初期設定
#### docker-compose.yml
docker-HyperEstraierはGUIを担当するコンテナ(app)と文章の登録を担当するコンテナ(estcmd)に分かれています。docker-compose.ymlのestcmd下にある./sourceにホスト上の検索したいPDFが入ったフォルダを指定してください
```
version: '3.3'

services:
  app:
    depends_on:
      - estcmd 
    build: ./lighttpd
    volumes:
      - ./index:/index
      - ./configuration_files:/configuration
      - ./lighttpd/startscript:/startscript
    ports: 
     - 80:80
    environment:
     - BASE_URL=http://localhost/
    restart: always
    networks:
      - default
  estcmd:
    build: ./estcmd
    volumes:
      - ./index:/index
      - ./source:/source
      - ./estcmd/startscript:/startscript
      - ./configuration_files:/cron_configuration
    networks:
      - default
  
```
検索されるファイルパスをURLで置き換えるためにBASE_URLを設定してください。  
例 ホストの/www/public/index.html が https://www.example.org/index.html でアクセスできる場合、BASE_URLは以下のようになります。
```
    environment:
     - BASE_URL=https://www.example.org/
```

### 起動
```
docker-compose up -d
```
初期設定の場合は  
[http://localhost:80/](http://localhost:80/)にアクセスするとインデックスページが現れます。  

### インデックスの更新時間
デフォルト設定ではUTC時間で毎日0時に新しく追加されたファイルがインデックスに登録されます。またUTC時間で毎日3時に削除されたファイルがインデックスから取り除かれます。