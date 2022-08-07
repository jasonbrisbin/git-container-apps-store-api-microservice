package main

import (
	"fmt"
	"os"

	dapr "github.com/dapr/go-sdk/client"
	"github.com/spf13/viper"
)

func main() {
	viper.SetConfigFile("config.yaml")
	viper.ReadInConfig()

	a := App{}

	client, err := dapr.NewClient()
	if err != nil {
		panic(err)
	}
	a.Initialize(
		client,
	)

	port := viper.GetString("port")
	if port == "" {
		port = os.Getenv("PORT")
		if port == "" {
			port = "8050"
		}
	}

	binding := fmt.Sprintf(":%s", port)

	a.Run(binding)
	defer client.Close()
}
