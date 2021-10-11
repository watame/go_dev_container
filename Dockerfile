# go言語の1.17を指定
FROM golang:1.17

# 環境変数の設定
# ワークディレクトリおよび、日本語環境設定の追加
# ※GoModuleを常に利用する
ENV APP_ROOT=/go_dev_container \
    LANG=ja_JP.UTF-8 \
    LC_CTYPE=ja_JP.UTF-8 \
    TZ=Asia/Tokyo \
    GO111MODULE=on

# ワークディレクトリを定義
# Dockerから命令する時にいるディレクトリを指定する
# https://docs.microsoft.com/ja-jp/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile#workdir
WORKDIR %{APP_ROOT}

# 自動補完等に必要なツールをインストール
# https://zenn.dev/bun913/articles/f0a6c6177a4716
# 依存関係のパッケージ更新を行うために '-u' を指定
RUN go get -u \
    github.com/uudashr/gopkgs/v2/cmd/gopkgs \
    github.com/ramya-rao-a/go-outline \
    github.com/nsf/gocode \
    github.com/acroca/go-symbols \
    github.com/fatih/gomodifytags \
    github.com/josharian/impl \
    github.com/haya14busa/goplay/cmd/goplay \
    github.com/go-delve/delve/cmd/dlv@master \
    golang.org/x/lint/golint \
    golang.org/x/tools/gopls