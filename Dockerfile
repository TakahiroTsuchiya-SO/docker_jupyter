FROM python:3.8-slim

WORKDIR /home/work/

RUN apt-get update && apt-get upgrade

# gitとかnodeとかのインストール
# slimを使う場合はnpmの設定いらない(1行目は消す)
RUN apt-get install -y --no-install-recommends \
    git \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /var/cache/apt/* \
        /usr/local/src/* \
        /tmp/*

# pythonのライブラリをインストール
COPY requirements.txt .
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt \
    && rm -rf ~/.cache/pip

# jupyterlabとextensionのインストール
# slimを使う場合は最後の2行いらない
RUN pip3 install --upgrade --no-cache-dir \
    'jupyterlab~=3.0' \
    && rm -rf ~/.cache/pip
