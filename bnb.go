package main2

import (
	"fmt"
	"strconv"

	"github.com/binance-chain/go-sdk/client"
	"github.com/binance-chain/go-sdk/common/types"
	"github.com/binance-chain/go-sdk/keys"
)

func main() {
	priv := "9579fff0cab07a4379e845a890105004ba4c8276f8ad9d22082b2acbf02d884b"
	keyManager, err := keys.NewPrivateKeyManager(priv)
	if err != nil {
		fmt.Println(err)
	}

	dexClient, err := client.NewDexClient("testnet-dex.binance.org:443", types.TestNetwork, keyManager)
	//dexClient, err := client.NewDexClient("dataseed1.binance.org:80", types.ProdNetwork, keyManager)

	if err != nil {
		fmt.Println("error:" + err.Error())
		return
	}
	account, err := dexClient.GetAccount("tbnb185tqzq3j6y7yep85lncaz9qeectjxqe5054cgn")
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	floatAmount := 0.0
	for _, coin := range account.Balances {
		if coin.Symbol == "BNB" {
			fmt.Println(fmt.Sprintf("Your account has %s:BNB", coin.Free))
			floatAmount, err = strconv.ParseFloat(coin.Free.String(), 64)
			if err != nil {
				fmt.Println(err.Error())
				return
			} else {
				fmt.Print("Blance:")
				fmt.Print(floatAmount)
				fmt.Print("\n")
			}
			break
		}
	}

	/*tokens, err := dexClient.GetTokens(types.NewTokensQuery())
	for _, token := range tokens {
		fmt.Printf("%v", token)
		fmt.Print("\n")
	}*/
	fmt.Print("\n")
	tx, err := dexClient.GetTx("AE695C596DB830A2CFFBD555F987AC3FA22857C214E9D69624DBC9DA28B9E526")

	if err == nil {
		fmt.Printf("%v", tx)
	} else {
		fmt.Print(err.Error())
	}
	fmt.Print("\n")
	dexClient.
	/*

		if err != nil {
			fmt.Println(err.Error())
			return
		} else {
			fmt.Println(receiverAddr)
		}
		dexClient, err := client.NewDexClient("testnet-dex.binance.org:443", types.TestNetwork, keyManager)
		if err != nil {
			fmt.Println(err.Error())
			return
		}

		account, err := dexClient.GetAccount(keyManager.GetAddr().String())
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		floatAmount := 0.0
		for _, coin := range account.Balances {
			if coin.Symbol == "BNB" {
				fmt.Println(fmt.Sprintf("Your account has %s:BNB", coin.Free))
				floatAmount, err = strconv.ParseFloat(coin.Free.String(), 64)
				if err != nil {
					fmt.Println(err.Error())
					return
				}
				break
			}
		}
		if floatAmount <= 1.0 {
			fmt.Println("Your account doesn't have enough bnb")
		}

		fmt.Println(fmt.Sprintf("Please verify sign key address (%s) and transaction data", types.AccAddress(keyManager.GetAddr()).String()))
		sendResult, err := dexClient.SendToken([]msg.Transfer{{receiverAddr, types.Coins{types.Coin{Denom: "BNB", Amount: 10000000}}}}, true)
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		fmt.Println(fmt.Sprintf("Send result: %t", sendResult.Ok))*/

}
