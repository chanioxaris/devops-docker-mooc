FROM golang:alpine as builder

COPY ../../Part1/1.15/golang-example-project .

RUN go build -ldflags="-w -s" -o server .

FROM alpine:latest

COPY --from=builder /go/server /server

RUN adduser -D app_user
USER app_user

EXPOSE 8080

CMD ./server