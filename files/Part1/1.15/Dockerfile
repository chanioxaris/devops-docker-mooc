FROM golang:1.14

COPY golang-example-project .
RUN GOOS=linux GOARCH=amd64 go build -o server .
EXPOSE 8080
CMD ./server