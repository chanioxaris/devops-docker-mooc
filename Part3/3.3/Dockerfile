FROM docker:latest

COPY buildService.sh buildService.sh

RUN apk add --no-cache git

ENTRYPOINT ["sh", "/buildService.sh"]