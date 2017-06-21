// Package crypto provides aes 加解密
package crypto2

import (
	"crypto/aes"
	"crypto/cipher"
	"errors"
)

type AESCrypter struct {
	encryptBlock cipher.BlockMode
	decryptBlock cipher.BlockMode
	block        cipher.Block
	key          []byte
}

func NewAES(key []byte) (Crypter, error) {
	block, err := aes.NewCipher(key[0:aes.BlockSize])
	if err != nil {
		return nil, err
	}

	cpt := &AESCrypter{
		encryptBlock: cipher.NewCBCEncrypter(block, []byte(key)[0:aes.BlockSize]),
		decryptBlock: cipher.NewCBCDecrypter(block, []byte(key)[0:aes.BlockSize]),
		key:          []byte(key)[0:aes.BlockSize],
		block:        block,
	}

	return cpt, nil

}

func (cpt *AESCrypter) Encrypt(src []byte) ([]byte, error) {

	src = PKCS5Padding(src, aes.BlockSize)

	if len(src)%aes.BlockSize != 0 {
		return nil, errors.New("padding error")
	}

	dst := make([]byte, len(src))

	encryptBlock := cipher.NewCBCEncrypter(cpt.block, []byte(cpt.key)[0:aes.BlockSize])

	encryptBlock.CryptBlocks(dst, src)

	return dst, nil
}

func (cpt *AESCrypter) Decrypt(src []byte) ([]byte, error) {

	dst := make([]byte, len(src))

	decryptBlock := cipher.NewCBCDecrypter(cpt.block, []byte(cpt.key)[0:aes.BlockSize])

	decryptBlock.CryptBlocks(dst, src)

	dst = PKCS5UnPadding(dst)

	return dst, nil
}

type Crypter interface {
	Encrypt([]byte) ([]byte, error)
	Decrypt([]byte) ([]byte, error)
}
