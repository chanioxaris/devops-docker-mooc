# Simple ping app
A simple app that starts a server which listens for incoming requests at `/ping` and responds with pong

## Installation
Installed Golang with version 1.14 or above is mandatory.

### Development mode
Set the environmental variable `PORT` for the server to listen to

Run `go run main.go` to start the server

### Production mode
Set the environmental variable `PORT` for the server to listen to

Make sure to use the correct `GOOS` and `GOARCH` build flags depending ou your operation system. A complete list can be found [here](https://gist.github.com/asukakenji/f15ba7e588ac42795f421b48b8aede63)

You have to build the app by running `GOOS=<value> GOARCH=<value> go build -o server .`

For example for a linux system the correct command would be `GOOS=linux GOARCH=amd64 go build -o server .`

Run `./server` to start the app

**The server listens by default at port 8080**
