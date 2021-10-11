// エントリーポイントは必ずpackage mainから始まる
// Goはpackageという単位でコンパイルが行われる（具体的には物理ディレクトリ内のファイル群を一つのパッケージとして処理する）
package main

// 外部パッケージ読み込み
import (
	"fmt"

	// インポート定義を追加した後に`go build main.go`を行う事でgo.modに追加読み込みされる
	"github.com/watame/go_dev_container/hello"
)

// エントリーポイントはmainという関数として定義する必要がある
func main() {
	// デバッグの仕方
	// https://qiita.com/poramal/items/11912b5533ec8e7dbaac#3-6-%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A%E5%86%85%E3%81%A7%E3%81%AEgo%E9%96%8B%E7%99%BAhello-world
	fmt.Println("Hello, Go-lang!!")
	name := hello.Input("type your name.")
	fmt.Println("Hello " + name + "!!")
}
