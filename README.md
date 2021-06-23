# 使い方

### 最初にやること
- 「use this template」と書いてある緑のボタンをクリック
- 自分のgit hubにリポジトリを移植
- 移植したリポジトリをローカルにclone
```
git clone {移植先url *波かっこ外す}
```

### dockerコンテナ系のコマンド
- 起動
```
docker-compose up -d
```
- コンテナ内部に入る
```
docker-compose exec jupyterlab bash
```
- コンテナ内部から出る
```
exit
```
- コンテナ関係の破棄
```
docker-compose down --rmi all
```

### ライブラリのインストール
- requirements.txtに追記する
- 既にコンテナを立ち上げてる場合は、cell内でインストールしたあとrequirements.txtにも追記する
```
!pip install numpy
```

### その他
- jupyter labの設定ファイルは/.jupyter/lab配下にある各ファイル
- このファイルをいじることでjupyter labの設定を変更できる
- コンテナ生成後であればGUIでも設定は変更可能