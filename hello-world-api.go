package main

import (
	"github.com/gin-gonic/gin"
	"github.com/lealoureiro/hello-world-api/config"
	log "github.com/sirupsen/logrus"
)

func main() {

	log.Info("Hello World API ", config.Version)

	r := gin.Default()
	r.GET("/hello-world", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello World",
			"version": config.Version,
		})
	})
	r.Run()

}
