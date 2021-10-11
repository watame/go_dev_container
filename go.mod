// module名はインターネット上のレポジトリで管理されることが前提
// githubで管理している場合はレポジトリ名をそのままmodule名とするのがベター
// (ローカルの場合は`example.com/aaa/bbb`のようにするのが良い)
// また、バージョン管理の観点から1レポジトリ、1モジュールにするのが常らしい
// https://zenn.dev/spiegel/articles/20210223-go-module-aware-mode
// https://qiita.com/hnishi/items/a9217249d7832ed2c035
// https://qiita.com/uchiko/items/64fb3020dd64cf211d4e
module github.com/watame/go_dev_container

go 1.17
