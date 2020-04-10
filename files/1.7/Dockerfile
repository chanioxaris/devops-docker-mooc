FROM ubuntu:18.04

RUN apt-get update && apt-get install curl -y
COPY script.sh .
RUN chmod 775 ./script.sh
CMD ["./script.sh"]
