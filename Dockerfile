# go言語の1.17を指定
FROM golang:1.17

# 環境変数の設定
# ワークディレクトリおよび、日本語環境設定の追加
# ※1.15以降は`GOMODULE111=on`がデフォルトになっているため、GoModuleを常に利用する状態になっている
ENV APP_ROOT=/go_dev_container \
    LANG=ja_JP.UTF-8 \
    LC_CTYPE=ja_JP.UTF-8 \
    TZ=Asia/Tokyo

# ワークディレクトリを定義
# Dockerから命令する時にいるディレクトリを指定する
# https://docs.microsoft.com/ja-jp/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile#workdir
WORKDIR %{APP_ROOT}

# 自動補完等に必要なツールをインストール
# https://zenn.dev/bun913/articles/f0a6c6177a4716
# https://qiita.com/y_shinoda/items/e6e2fef46408c0bae83b
# 1.16からは$GOPATH/binにモジュールを入れる際には`go install`を利用することが推奨されているのでそれに倣う
# https://qiita.com/eihigh/items/9fe52804610a8c4b7e41
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install github.com/ramya-rao-a/go-outline@latest
RUN go install github.com/cweill/gotests/gotests@latest
RUN go install github.com/nsf/gocode@latest
RUN go install github.com/acroca/go-symbols@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/josharian/impl@latest
# del-dapは明示的にインストール先の名称を変更する必要があるので、インストール後にバイナリファイルを移動させる
# https://github.com/golang/vscode-go/blob/v0.26.0/docs/dlv-dap.md#updating-dlv-dap
RUN GOBIN=/tmp/ go install github.com/go-delve/delve/cmd/dlv@master && \
    mv /tmp/dlv $GOPATH/bin/dlv-dap
RUN go install golang.org/x/lint/golint@latest
RUN go install golang.org/x/tools/gopls@latest