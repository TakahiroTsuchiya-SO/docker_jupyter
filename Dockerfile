FROM python:3.8
# FROM python:3.8-slim

RUN apt-get update -y \
    && apt-get upgrade -y

# gitとかnodeとかのインストール
# slimを使う場合はnpmの設定いらない(1行目は消す)
RUN curl -sL https://deb.nodesource.com/setup_12.x |bash - \
    && apt-get install -y --no-install-recommends \
    git \
    curl \
    nodejs \
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
    && rm -rf ~/.cache/pip \
    && jupyter labextension install \
        @jupyterlab/toc

WORKDIR /home/work/