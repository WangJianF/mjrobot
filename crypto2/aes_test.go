package crypto2

import (
	"fmt"
	"gd/util"
	"testing"
)

func TestAES(t *testing.T) {
	var src = []byte{48, 73, 17, 88, 90, 81, 94, 86, 109, 72, 66, 86, 22, 15, 7, 27, 67, 188, 46, 39, 159, 6, 43, 124, 111, 134, 4, 96, 93, 200, 95, 98, 192, 220, 13, 74, 211, 64, 1, 172, 154, 138, 239, 60, 0, 130, 37, 135, 80, 12, 54, 164, 51, 16, 19, 47, 98, 97, 158, 94, 140, 184, 30, 181}

	aes, err := NewAES([]byte("1234567891234567"))
	util.PanicErr(err)

	cli, err := aes.Decrypt(src)
	util.PanicErr(err)
	fmt.Println(cli)

}
