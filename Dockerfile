FROM alpine:latest
RUN apk add --no-cache python3
RUN pip3 install speedtest-cli
ENTRYPOINT ["speedtest-cli"]
CMD ["--simple", "--share"]
