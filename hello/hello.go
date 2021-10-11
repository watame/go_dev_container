package hello

// 外部パッケージ読み込み
import (
	"bufio"
	"fmt"
	"os"
)

func Input(msg string) string {
	scanner := bufio.NewScanner(os.Stdin)
	fmt.Print(msg + ":")
	scanner.Scan()
	return scanner.Text()
}
