FROM node:alpine as builder

ENV API_URL=http://localhost:8000

COPY frontend-example-docker .

RUN npm install && \
    npm run build

FROM node:alpine

COPY --from=builder dist dist
RUN npm install -g serve && \
    adduser -D app_user

USER app_user

EXPOSE 5000

CMD serve -s -l 5000 dist

